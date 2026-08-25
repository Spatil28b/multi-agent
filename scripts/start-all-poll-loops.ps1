# start-all-poll-loops.ps1
# Run this script ONCE to open 6 terminal windows - one per subagent.
# Each terminal auto-polls GitHub every 30s and beeps when a task appears.
# Usage: .\scripts\start-all-poll-loops.ps1

$projectDir = $PSScriptRoot | Split-Path -Parent
$agents = @("architect", "developer", "qa", "bug-fixer", "security-reviewer", "code-reviewer")
$colors = @("Cyan", "Green", "Yellow", "Red", "Magenta", "White")

Write-Host ""
Write-Host "Starting poll loops for all 6 subagents..." -ForegroundColor Cyan
Write-Host "Project folder: $projectDir" -ForegroundColor DarkGray
Write-Host ""

for ($i = 0; $i -lt $agents.Length; $i++) {
    $agent = $agents[$i]
    $title = "AGENT: $($agent.ToUpper()) — POLL LOOP"
    
    $command = "Set-Location '$projectDir'; Write-Host 'POLL LOOP: $agent' -ForegroundColor $($colors[$i]); .\scripts\poll-loop.ps1 -Agent '$agent' -IntervalSeconds 30"
    
    Start-Process powershell -ArgumentList "-NoExit", "-Command", $command -WindowStyle Normal
    
    Write-Host "  Started terminal for: $agent" -ForegroundColor $colors[$i]
    Start-Sleep -Milliseconds 500
}

Write-Host ""
Write-Host "All 6 poll loops running!" -ForegroundColor Green
Write-Host "Each terminal will beep + alert when its agent has a task." -ForegroundColor Green
Write-Host ""
Write-Host "Now open 7 Antigravity IDE windows:" -ForegroundColor Yellow
Write-Host "  Window 1 → paste .agents/activation/WINDOW-1-LEAD.md" -ForegroundColor Yellow
Write-Host "  Window 2 → paste .agents/activation/WINDOW-2-ARCHITECT.md" -ForegroundColor Yellow
Write-Host "  Window 3 → paste .agents/activation/WINDOW-3-DEVELOPER.md" -ForegroundColor Yellow
Write-Host "  Window 4 → paste .agents/activation/WINDOW-4-QA.md" -ForegroundColor Yellow
Write-Host "  Window 5 → paste .agents/activation/WINDOW-5-BUG-FIXER.md" -ForegroundColor Yellow
Write-Host "  Window 6 → paste .agents/activation/WINDOW-6-SECURITY.md" -ForegroundColor Yellow
Write-Host "  Window 7 → paste .agents/activation/WINDOW-7-CODE-REVIEWER.md" -ForegroundColor Yellow
Write-Host ""
Write-Host "Then paste the matching FIRST COMMAND from:" -ForegroundColor Yellow
Write-Host "  .agents/activation/FIRST-COMMAND-FOR-SUBAGENTS.md" -ForegroundColor Yellow
Write-Host ""