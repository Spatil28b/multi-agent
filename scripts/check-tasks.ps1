# check-tasks.ps1
# Usage: .\scripts\check-tasks.ps1 -Agent architect
# Reads .ai/task-board.yaml and shows tasks assigned to the given agent with status "ready"

param(
    [Parameter(Mandatory=$true)]
    [string]$Agent,
    [switch]$NoPull
)

# Pull latest state first unless -NoPull is passed
if (-not $NoPull) {
    git pull --quiet 2>&1 | Out-Null
}

$taskFile = ".ai\task-board.yaml"

if (-not (Test-Path $taskFile)) {
    Write-Host "[NO TASK-BOARD] .ai/task-board.yaml not found" -ForegroundColor Red
    exit 1
}

$content = Get-Content $taskFile -Raw
$lines = Get-Content $taskFile

$allTasks = @()
$currentTask = $null

foreach ($line in $lines) {
    # Match any task header like "  TASK-001:" or "TASK-001:" or "  TASK_001:"
    if ($line -match "^\s*(TASK[-_]\w+):") {
        if ($currentTask) {
            $allTasks += $currentTask
        }
        $currentTask = @{
            id          = $Matches[1]
            title       = "Untitled"
            owner       = ""
            status      = ""
            description = ""
        }
        continue
    }

    if ($currentTask) {
        if ($line -match "^\s*title:\s*[`"']?(.*?)['`"]?\s*$") {
            $currentTask.title = $Matches[1].Trim()
        }
        elseif ($line -match "^\s*owner:\s*[`"']?(.*?)['`"]?\s*$") {
            $currentTask.owner = $Matches[1].Trim().ToLower()
        }
        elseif ($line -match "^\s*status:\s*[`"']?(.*?)['`"]?\s*$") {
            $currentTask.status = $Matches[1].Trim().ToLower()
        }
        elseif ($line -match "^\s*description:\s*[`"']?(.*?)['`"]?\s*$") {
            $currentTask.description = $Matches[1].Trim()
        }
    }
}

# Add last task
if ($currentTask) {
    $allTasks += $currentTask
}

$targetAgent = $Agent.Trim().ToLower()
$foundTasks = @()

foreach ($t in $allTasks) {
    $ownerMatches = ($t.owner -eq $targetAgent) -or ($targetAgent -eq "all")
    $statusIsReady = ($t.status -eq "ready") -or ($t.status -eq "running") -or ($t.status -eq "in_progress") -or ($t.status -eq "todo")
    
    if ($ownerMatches -and $statusIsReady) {
        $foundTasks += $t
    }
}

if ($foundTasks.Count -eq 0) {
    Write-Host ""
    Write-Host "[IDLE] No active/ready tasks assigned to '$Agent'." -ForegroundColor Yellow
    
    if ($allTasks.Count -gt 0) {
        Write-Host "Current tasks on board:" -ForegroundColor DarkGray
        foreach ($t in $allTasks) {
            Write-Host "  - $($t.id): owner='$($t.owner)', status='$($t.status)', title='$($t.title)'" -ForegroundColor DarkGray
        }
    } else {
        Write-Host "  (Task board has 0 tasks)" -ForegroundColor DarkGray
    }
    Write-Host ""
    exit 0
} else {
    Write-Host "" 
    Write-Host "==================================================" -ForegroundColor Green
    Write-Host "  TASK(S) FOUND FOR AGENT: $($Agent.ToUpper())" -ForegroundColor Green
    Write-Host "==================================================" -ForegroundColor Green
    foreach ($t in $foundTasks) {
        Write-Host ""
        Write-Host "  TASK ID : $($t.id)" -ForegroundColor Cyan
        Write-Host "  TITLE   : $($t.title)" -ForegroundColor Cyan
        Write-Host "  STATUS  : $($t.status)" -ForegroundColor Cyan
        Write-Host "  OWNER   : $($t.owner)" -ForegroundColor Cyan
        if ($t.description) {
            Write-Host "  DESC    : $($t.description)" -ForegroundColor White
        }
        Write-Host ""
        Write-Host "  ACTION  : Read full details from .ai/task-board.yaml and execute." -ForegroundColor Yellow
    }
    Write-Host "==================================================" -ForegroundColor Green
    Write-Host ""
    exit 1  # exit 1 = task found (triggers poll loop alert)
}