# Workflow: Code Review

Invoke after implementation and QA are complete.

## Steps

### Step 1: Provide Context
Give code-reviewer agent: changed files, original requirement, acceptance criteria.

### Step 2: Review
Code reviewer checks: correctness, architecture, duplication, error handling, tests, performance, backward compatibility, security.

### Step 3: Handle Verdict
If APPROVED: proceed to final verification.
If CHANGES_REQUIRED:
  Developer addresses BLOCKER findings.
  Lead decides on WARNING findings.
  Code reviewer re-reviews changed files.

### Step 4: Final Approval
Code reviewer issues final APPROVED verdict.
