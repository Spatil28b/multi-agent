# setup-agent-workspaces.ps1
# Creates separate directories for Lead and all Sub-Agents
# Usage: .\scripts\setup-agent-workspaces.ps1

param(
    [string]$RepoUrl = ""
)

$rootDir = $PSScriptRoot | Split-Path -Parent

if (-not $RepoUrl) {
    # Get origin URL from current git repo
    $RepoUrl = git config --get remote.origin.url
    if (-not $RepoUrl) {
        $RepoUrl = "https://github.com/Spatil28b/multi-agent.git"
    }
}

Write-Host ""
Write-Host "==================================================" -ForegroundColor Cyan
Write-Host "  CREATING MULTI-AGENT WORKSPACE DIRECTORIES" -ForegroundColor Cyan
Write-Host "  Root Directory : $rootDir" -ForegroundColor DarkGray
Write-Host "  Repository URL : $RepoUrl" -ForegroundColor DarkGray
Write-Host "==================================================" -ForegroundColor Cyan
Write-Host ""

$agentList = @(
    @{ name="main-agent";            role="lead";              path="main-agent";                     prompt="WINDOW-1-LEAD.md" },
    @{ name="architect";             role="architect";         path="sub-agents\architect";           prompt="WINDOW-2-ARCHITECT.md" },
    @{ name="developer";             role="developer";         path="sub-agents\developer";           prompt="WINDOW-3-DEVELOPER.md" },
    @{ name="qa";                    role="qa";                path="sub-agents\qa";                  prompt="WINDOW-4-QA.md" },
    @{ name="bug-fixer";             role="bug-fixer";         path="sub-agents\bug-fixer";           prompt="WINDOW-5-BUG-FIXER.md" },
    @{ name="security-reviewer";     role="security-reviewer"; path="sub-agents\security-reviewer";   prompt="WINDOW-6-SECURITY.md" },
    @{ name="code-reviewer";         role="code-reviewer";     path="sub-agents\code-reviewer";       prompt="WINDOW-7-CODE-REVIEWER.md" }
)

foreach ($agent in $agentList) {
    $targetDir = Join-Path $rootDir $agent.path
    
    if (-not (Test-Path $targetDir)) {
        Write-Host "Creating workspace for [$($agent.name)] at: $($agent.path)..." -ForegroundColor Yellow
        New-Item -ItemType Directory -Path $targetDir -Force | Out-Null
        
        # Clone or initialize git in target folder
        Set-Location $targetDir
        git clone --quiet $RepoUrl . 2>&1 | Out-Null
        if ($LASTEXITCODE -ne 0) {
            # If clone into non-empty fails, init & pull
            git init --quiet
            git remote add origin $RepoUrl
            git pull --quiet origin master
        }
        
        # Create an easy README right inside that folder
        $agentReadme = @"
# WORKSPACE: $($agent.name.ToUpper())

You are running in the dedicated workspace folder for: **$($agent.role)**

## Activation
Copy and paste the instructions from:
`.agents/activation/$($agent.prompt)`

Then follow the standard polling / task execution instructions.
"@
        Set-Content -Path "AGENT-START.md" -Value $agentReadme -Encoding UTF8
        Write-Host "  [OK] $($agent.name) ready!" -ForegroundColor Green
    } else {
        Write-Host "  [EXISTS] $($agent.name) workspace already exists." -ForegroundColor DarkGray
    }
}

Set-Location $rootDir

# Add workspace folders to root .gitignore so root repo stays clean
$ignoreEntries = @"

# Multi-Agent Workspaces
main-agent/
sub-agents/
"@
Add-Content -Path ".gitignore" -Value $ignoreEntries

Write-Host ""
Write-Host "==================================================" -ForegroundColor Green
Write-Host "  ALL 7 AGENT WORKSPACES CREATED SUCCESSFULLY!" -ForegroundColor Green
Write-Host "==================================================" -ForegroundColor Green
Write-Host ""
Write-Host "Open each directory in a separate Antigravity IDE Window:" -ForegroundColor White
Write-Host "  1. Open folder: $rootDir\main-agent" -ForegroundColor Cyan
Write-Host "  2. Open folder: $rootDir\sub-agents\architect" -ForegroundColor Cyan
Write-Host "  3. Open folder: $rootDir\sub-agents\developer" -ForegroundColor Cyan
Write-Host "  4. Open folder: $rootDir\sub-agents\qa" -ForegroundColor Cyan
Write-Host "  5. Open folder: $rootDir\sub-agents\bug-fixer" -ForegroundColor Cyan
Write-Host "  6. Open folder: $rootDir\sub-agents\security-reviewer" -ForegroundColor Cyan
Write-Host "  7. Open folder: $rootDir\sub-agents\code-reviewer" -ForegroundColor Cyan
Write-Host ""