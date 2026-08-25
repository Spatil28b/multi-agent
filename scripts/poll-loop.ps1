# poll-loop.ps1
# Background polling loop - runs in a terminal window
# Auto-pulls GitHub every 30s, checks for tasks, beeps + prints when task found
# Usage: .\scripts\poll-loop.ps1 -Agent architect -IntervalSeconds 30

param(
    [Parameter(Mandatory=$true)]
    [string]$Agent,
    [int]$IntervalSeconds = 30
)

$iteration = 0

Write-Host ""
Write-Host "================================================" -ForegroundColor Magenta
Write-Host "  AGENT POLL LOOP STARTED" -ForegroundColor Magenta
Write-Host "  Agent  : $Agent" -ForegroundColor Magenta
Write-Host "  Polling: every $IntervalSeconds seconds" -ForegroundColor Magenta
Write-Host "  Watching: GitHub repo via git pull" -ForegroundColor Magenta
Write-Host "================================================" -ForegroundColor Magenta
Write-Host ""

while ($true) {
    $iteration++
    $timestamp = Get-Date -Format "HH:mm:ss"
    
    Write-Host "[$timestamp] Poll #$iteration — pulling from GitHub..." -ForegroundColor DarkGray
    
    # Pull latest from GitHub
    $pullResult = git pull --quiet 2>&1
    if ($LASTEXITCODE -ne 0) {
        Write-Host "  [WARN] git pull failed: $pullResult" -ForegroundColor Yellow
    } else {
        if ($pullResult -and $pullResult -notmatch "Already up to date") {
            Write-Host "  [UPDATED] New changes pulled from GitHub!" -ForegroundColor Green
        }
    }
    
    # Check for tasks assigned to this agent
    $checkResult = & powershell -File ".\scripts\check-tasks.ps1" -Agent $Agent 2>&1
    $taskFound = $LASTEXITCODE -eq 1
    
    if ($taskFound) {
        # ALERT - task found
        Write-Host ""
        Write-Host "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" -ForegroundColor Red
        Write-Host "  TASK ASSIGNED TO: $Agent" -ForegroundColor Red
        Write-Host "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!" -ForegroundColor Red
        $checkResult | ForEach-Object { Write-Host $_ }
        Write-Host ""
        Write-Host ">>> Switch to your IDE window for $Agent and run the FIRST COMMAND <<<" -ForegroundColor Yellow
        Write-Host ""
        
        # Beep 3 times to alert user
        [System.Console]::Beep(800, 300)
        Start-Sleep -Milliseconds 200
        [System.Console]::Beep(800, 300)
        Start-Sleep -Milliseconds 200
        [System.Console]::Beep(1000, 500)
        
        # Keep polling even after task found (for additional tasks)
        Write-Host "[$timestamp] Continuing to poll for additional tasks..." -ForegroundColor DarkGray
    } else {
        Write-Host "  [IDLE] No tasks for $Agent" -ForegroundColor DarkGray
    }
    
    Write-Host ""
    Start-Sleep -Seconds $IntervalSeconds
}