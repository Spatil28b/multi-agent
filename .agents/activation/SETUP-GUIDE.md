# Multi-Window Setup Guide

## How It Works

7 Antigravity IDE windows. Same project folder. Shared .ai/ memory.
The .ai/task-board.yaml file is the coordination hub between all windows.

## Window Map

| Window | Agent | Role |
|--------|-------|------|
| 1 | LEAD | You talk here. Coordinator. Manager. |
| 2 | ARCHITECT | Analyzes code. Creates implementation plans. |
| 3 | DEVELOPER | Writes code. Runs tests. |
| 4 | QA | Breaks the implementation. Finds bugs. |
| 5 | BUG-FIXER | Fixes bugs. Adds regression tests. |
| 6 | SECURITY | Security review. Finds vulnerabilities. |
| 7 | CODE-REVIEWER | Final code quality gate. Approves/blocks. |

## Step 1 — Open 7 IDE Windows

Open Antigravity IDE 7 times.
Each time: open the SAME project folder.

## Step 2 — Activate Each Window

In each window, open the matching activation file and paste its ENTIRE content as your first message:

  Window 1 → paste content of: .agents/activation/WINDOW-1-LEAD.md
  Window 2 → paste content of: .agents/activation/WINDOW-2-ARCHITECT.md
  Window 3 → paste content of: .agents/activation/WINDOW-3-DEVELOPER.md
  Window 4 → paste content of: .agents/activation/WINDOW-4-QA.md
  Window 5 → paste content of: .agents/activation/WINDOW-5-BUG-FIXER.md
  Window 6 → paste content of: .agents/activation/WINDOW-6-SECURITY.md
  Window 7 → paste content of: .agents/activation/WINDOW-7-CODE-REVIEWER.md

## Step 3 — Talk Only to Window 1 (Lead)

Example:
  You → Window 1: "Implement user authentication with JWT"

The Lead will:
  - Plan the work
  - Write tasks to .ai/task-board.yaml
  - Tell you: "Go to Window 2 (Architect) and say: check task-board — TASK-001 is assigned to you"

## Step 4 — Trigger Specialist Windows When Lead Directs

When Lead says go to Window N:
  Switch to that window
  Type exactly what Lead told you to say
  Wait for the specialist to complete
  Go back to Lead and report: "Window N done"

## Step 5 — Lead Integrates and Continues

Lead reads the specialist results from .ai/task-board.yaml
Lead decides next step
Repeat until feature is complete

## Real Workflow Example

  You (W1-Lead): "Implement user login"
  Lead: "Going to W2 (Architect) — check task-board TASK-001"

  You (W2-Architect): "check task-board — TASK-001 is assigned to you"
  Architect: [analyzes, writes plan to .ai/architecture.md, updates task-board]
  Architect: "ARCHITECT COMPLETE — TASK-001 done."

  You (W1-Lead): "W2 done"
  Lead: "Going to W3 (Developer) — check task-board TASK-002 and TASK-003"
  [Note: you can trigger W3 with both tasks since developer handles both]

  You (W3-Developer): "check task-board — TASK-002 is assigned to you"
  Developer: [reads plan, implements, tests, reports]

  You (W1-Lead): "W3 done"
  Lead: "Going to W4 (QA) — check task-board TASK-004"
  ... and so on

## Parallel Work

When Lead assigns multiple tasks to the SAME role type simultaneously,
you can trigger them back-to-back in the same window.

When Lead assigns tasks to DIFFERENT agents simultaneously,
you can switch between windows quickly to trigger them
(they work independently so ordering does not matter).

## Memory — The .ai/ Files

All windows share these files. They are the team memory.

  .ai/project-profile.md  → technology stack (all agents read this)
  .ai/task-board.yaml     → task assignments (Lead writes, agents update)
  .ai/architecture.md     → Architect writes here
  .ai/bugs.md             → QA writes bugs here
  .ai/decisions.md        → Architect writes decisions here
  .ai/test-results.md     → Developer and QA write test results here
  .ai/current-work.md     → Lead updates with active feature
  .ai/project-state.md    → Lead updates overall status

## Session Resume

If you close and reopen a window, just paste the activation prompt again.
The agent will read .ai/ files and know exactly where things left off.

## Minimum Windows

You do not need all 7 for every task.

  Simple bug fix:     W1-Lead + W5-Bug-Fixer + W4-QA
  Small feature:      W1-Lead + W3-Developer + W4-QA
  Full feature:       All 7 windows