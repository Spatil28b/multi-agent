# Workflow: Autonomous Feature

Invoke when implementing any medium-to-large feature request.

## Steps

### Step 1: Inspect
Lead reads .ai/project-profile.md, .ai/architecture.md, and relevant source modules.

### Step 2: Architect
Delegate to architect agent.
Input: feature description + relevant source files.
Output: IMPLEMENTATION_PLAN + VERIFICATION_PLAN.

### Step 3: Plan Task Graph
Lead creates tasks in .ai/task-board.yaml.
Identify parallel vs sequential tasks.
Assign ownership boundaries to each task.

### Step 4: Parallel Implementation
Launch independent tasks concurrently (max 6-8 parallel agents).
Each agent owns its file boundary.
Each agent must return structured evidence.

### Step 5: Integration
Lead collects worker results.
Verify interfaces, imports, APIs, schemas, types, config.
Run build.
Fix integration issues before proceeding.

### Step 6: Verify
Run all available verification (format, lint, typecheck, unit, integration, API, E2E, build).
Update .ai/test-results.md.

### Step 7: QA
Delegate to qa agent.
QA must attempt to break the implementation.
QA returns bugs in structured format.

### Step 8: Bug Fix Loop (max 3 attempts)
For each bug:
  bug-fixer reads report -> reproduces -> fixes -> adds regression test -> verifies.
  QA re-tests.
  If still failing after attempt 3: escalate to human.

### Step 9: Security Review
If change touches auth, authorization, input, APIs, data access, uploads, or secrets:
Delegate to security-reviewer.
Fix CRITICAL and HIGH findings before proceeding.

### Step 10: Code Review
Delegate to code-reviewer.
If CHANGES_REQUIRED: fix and re-review.
If APPROVED: proceed.

### Step 11: Final Verification
Run complete verification suite one final time.
All checks must pass.

### Step 12: Report
Lead reports to user with full evidence (see completion report format in lead.md).
Update .ai/project-state.md and .ai/current-work.md.
