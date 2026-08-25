# push-result.ps1
# Called by agents after completing their work to commit and push results
# Usage: .\scripts\push-result.ps1 -Agent architect -TaskId TASK-001 -Message "Architect analysis complete"

param(
    [Parameter(Mandatory=$true)]
    [string]$Agent,
    [Parameter(Mandatory=$true)]
    [string]$TaskId,
    [Parameter(Mandatory=$true)]
    [string]$Message
)

$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm"

Write-Host ""
Write-Host "Committing and pushing results for $Agent — $TaskId..." -ForegroundColor Cyan

git add .ai/ -A
git add -A
$commitMsg = "agent($Agent): $TaskId — $Message

Agent: $Agent
Task: $TaskId
Time: $timestamp"

git commit -m $commitMsg
if ($LASTEXITCODE -ne 0) {
    Write-Host "[WARN] Nothing to commit or commit failed" -ForegroundColor Yellow
} else {
    git push
    if ($LASTEXITCODE -eq 0) {
        Write-Host ""
        Write-Host "========================================" -ForegroundColor Green
        Write-Host "  PUSHED TO GITHUB SUCCESSFULLY" -ForegroundColor Green
        Write-Host "  Agent : $Agent" -ForegroundColor Green
        Write-Host "  Task  : $TaskId" -ForegroundColor Green
        Write-Host "========================================" -ForegroundColor Green
    } else {
        Write-Host "[ERROR] Push failed. Check credentials." -ForegroundColor Red
    }
}