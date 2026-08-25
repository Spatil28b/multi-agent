# check-tasks.ps1
# Usage: .\scripts\check-tasks.ps1 -Agent architect
# Reads .ai/task-board.yaml and shows tasks assigned to the given agent with status "ready"

param(
    [Parameter(Mandatory=$true)]
    [string]$Agent
)

$taskFile = ".ai\task-board.yaml"

if (-not (Test-Path $taskFile)) {
    Write-Host "[NO TASK-BOARD] .ai/task-board.yaml not found" -ForegroundColor Red
    exit 1
}

$content = Get-Content $taskFile -Raw
$lines = Get-Content $taskFile

$currentTask = $null
$inTask = $false
$taskId = ""
$taskOwner = ""
$taskStatus = ""
$taskTitle = ""
$taskDesc = ""
$foundTasks = @()

foreach ($line in $lines) {
    if ($line -match "^\s{2}(TASK-\d+):") {
        $currentTask = @{ id=$Matches[1]; owner=""; status=""; title=""; description="" }
    }
    if ($currentTask -and $line -match "^\s{4}title:\s*[`"']?(.+?)[`"']?\s*$") {
        $currentTask.title = $Matches[1]
    }
    if ($currentTask -and $line -match "^\s{4}owner:\s*[`"']?(.+?)[`"']?\s*$") {
        $currentTask.owner = $Matches[1]
    }
    if ($currentTask -and $line -match "^\s{4}status:\s*[`"']?(.+?)[`"']?\s*$") {
        $currentTask.status = $Matches[1]
        # When we get status, check if this task is for us
        if ($currentTask.owner -eq $Agent -and $currentTask.status -eq "ready") {
            $foundTasks += $currentTask
        }
        $currentTask = $null
    }
}

if ($foundTasks.Count -eq 0) {
    Write-Host "[IDLE] No tasks assigned to '$Agent' with status 'ready'" -ForegroundColor Yellow
    exit 0
} else {
    Write-Host "" 
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "  TASK(S) FOUND FOR AGENT: $Agent" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    foreach ($t in $foundTasks) {
        Write-Host ""
        Write-Host "  ID:     $($t.id)" -ForegroundColor Cyan
        Write-Host "  TITLE:  $($t.title)" -ForegroundColor Cyan
        Write-Host "  STATUS: $($t.status)" -ForegroundColor Cyan
        Write-Host ""
        Write-Host "  ACTION: Read full task from .ai/task-board.yaml and execute now." -ForegroundColor White
    }
    Write-Host "========================================" -ForegroundColor Green
    exit 1  # exit 1 = task found (used by poll loop to trigger action)
}