================================================================
FIRST COMMAND FOR ALL SUBAGENT WINDOWS
================================================================

Copy this EXACT text and paste it as your FIRST message in each
subagent window AFTER pasting the activation prompt.

Replace [AGENT-NAME] with the agent for that window.

================================================================
FIRST COMMAND (paste after activation prompt):
================================================================

I am now activating your autonomous GitHub polling mode.

Your agent name is: [AGENT-NAME]
(Replace with: architect / developer / qa / bug-fixer / security-reviewer / code-reviewer)

Execute this sequence NOW:

STEP 1 — Initial setup:
  Run: git pull
  Run: .\scripts\check-tasks.ps1 -Agent [AGENT-NAME]
  Report what you find.

STEP 2 — Enter WATCH MODE:
  You are now in continuous watch mode.
  Every time I (the user) type "check" or "poll", you must:
    1. Run: git pull
    2. Run: .\scripts\check-tasks.ps1 -Agent [AGENT-NAME]
    3. If a task is found: IMMEDIATELY read it from .ai/task-board.yaml and execute your role
    4. If no task: report "IDLE — no tasks assigned"

STEP 3 — When you find and complete a task:
  1. Execute your full role procedure (see .agents/agents/[AGENT-NAME].md)
  2. Update .ai/task-board.yaml — set your task status to "review"
  3. Fill in the "result" field with FULL EVIDENCE (not just "done")
  4. Run: .\scripts\push-result.ps1 -Agent [AGENT-NAME] -TaskId TASK-NNN -Message "your summary"
  5. Report to me: "COMPLETE — TASK-NNN done and pushed to GitHub"

STRICT RULES YOU MUST ALWAYS FOLLOW:
  - NEVER modify files outside your task's "files" list
  - NEVER report complete without running actual tests/commands
  - NEVER write "done" without evidence in the result field
  - ALWAYS git pull before starting any task (get latest code)
  - ALWAYS push results immediately after completing

Start now. Run git pull and check-tasks.
================================================================

================================================================
WINDOW-SPECIFIC FIRST COMMANDS (ready to paste):
================================================================

--- WINDOW 2 (ARCHITECT) — paste this after activation prompt ---

I am now activating your autonomous GitHub polling mode.
Your agent name is: architect
Run: git pull
Run: .\scripts\check-tasks.ps1 -Agent architect
Report what you find. You are now in WATCH MODE — type "check" anytime to poll.
When a task appears: read .ai/task-board.yaml, read relevant source files, produce your ARCHITECT report, update task-board status to "review" with full result, then run: .\scripts\push-result.ps1 -Agent architect -TaskId TASK-NNN -Message "analysis complete"

--- WINDOW 3 (DEVELOPER) — paste this after activation prompt ---

I am now activating your autonomous GitHub polling mode.
Your agent name is: developer
Run: git pull
Run: .\scripts\check-tasks.ps1 -Agent developer
Report what you find. You are now in WATCH MODE — type "check" anytime to poll.
When a task appears: git pull first, read .ai/architecture.md for the plan, read existing code patterns, implement changes, run tests, update task-board status to "review" with test evidence, then run: .\scripts\push-result.ps1 -Agent developer -TaskId TASK-NNN -Message "implementation complete, N tests passed"

--- WINDOW 4 (QA) — paste this after activation prompt ---

I am now activating your autonomous GitHub polling mode.
Your agent name is: qa
Run: git pull
Run: .\scripts\check-tasks.ps1 -Agent qa
Report what you find. You are now in WATCH MODE — type "check" anytime to poll.
When a task appears: git pull first, run your full QA checklist, write bugs to .ai/bugs.md, update task-board status to "review" with all findings, then run: .\scripts\push-result.ps1 -Agent qa -TaskId TASK-NNN -Message "QA complete - N bugs found"

--- WINDOW 5 (BUG-FIXER) — paste this after activation prompt ---

I am now activating your autonomous GitHub polling mode.
Your agent name is: bug-fixer
Run: git pull
Run: .\scripts\check-tasks.ps1 -Agent bug-fixer
Report what you find. You are now in WATCH MODE — type "check" anytime to poll.
When a task appears: git pull first, read the bug from .ai/bugs.md, reproduce it, fix root cause, add regression test, run tests, update .ai/bugs.md status to FIXED, update task-board status to "review", then run: .\scripts\push-result.ps1 -Agent bug-fixer -TaskId TASK-NNN -Message "BUG-NNN fixed, regression test added"

--- WINDOW 6 (SECURITY) — paste this after activation prompt ---

I am now activating your autonomous GitHub polling mode.
Your agent name is: security-reviewer
Run: git pull
Run: .\scripts\check-tasks.ps1 -Agent security-reviewer
Report what you find. You are now in WATCH MODE — type "check" anytime to poll.
When a task appears: git pull first, read all changed files in the task, run your full security checklist, write findings to task result field, update task-board status to "review" (or "failed" if CRITICAL found), then run: .\scripts\push-result.ps1 -Agent security-reviewer -TaskId TASK-NNN -Message "security review complete - APPROVED or BLOCKED"

--- WINDOW 7 (CODE-REVIEWER) — paste this after activation prompt ---

I am now activating your autonomous GitHub polling mode.
Your agent name is: code-reviewer
Run: git pull
Run: .\scripts\check-tasks.ps1 -Agent code-reviewer
Report what you find. You are now in WATCH MODE — type "check" anytime to poll.
When a task appears: git pull first, read all changed files in the task, run your full review checklist, write APPROVED or CHANGES_REQUIRED verdict with exact findings to task result, update task-board status to "review", then run: .\scripts\push-result.ps1 -Agent code-reviewer -TaskId TASK-NNN -Message "code review - APPROVED or CHANGES_REQUIRED"
================================================================