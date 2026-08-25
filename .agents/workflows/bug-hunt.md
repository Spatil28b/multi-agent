# Workflow: Bug Hunt

Invoke when a bug needs investigation and fixing.

## Steps

### Step 1: Reproduce
Read bug report or user description.
Attempt to reproduce the bug.
Document reproduction steps in .ai/bugs.md.

### Step 2: Investigate
For simple bugs: assign to bug-fixer directly.
For difficult bugs: spawn 2-3 independent investigators.
  Investigator A: reproduce + trace one hypothesis.
  Investigator B: independent root-cause analysis.
  Investigator C (if needed): review logs/data/architecture.
Lead compares evidence from all investigators.

### Step 3: Fix
Assign fix to bug-fixer with confirmed root cause.
Bug fixer: reproduces, implements minimal fix, adds regression test, verifies.

### Step 4: QA
QA agent re-tests the fix.
QA re-tests related areas for regression.

### Step 5: Verify
Run full verification suite.

### Step 6: Report
Lead reports fix status, evidence, and any remaining risks.
