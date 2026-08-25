# Workflow: Full Verify

Invoke to run a complete quality and correctness check of the project.

## Steps

### Step 1: Detect
Read .ai/project-profile.md to determine available verification commands.

### Step 2: Format
Run code formatter if available. Report violations.

### Step 3: Lint
Run linter if available. Report violations.

### Step 4: Typecheck
Run type checker if available. Report errors.

### Step 5: Unit Tests
Run unit test suite. Report pass/fail counts and failures.

### Step 6: Integration Tests
Run integration test suite if available. Report results.

### Step 7: E2E Tests
Run E2E test suite if available. Report results.

### Step 8: Build
Run build command. Report success or failure.

### Step 9: Security Scan
Run security scan if available (e.g., npm audit, safety, bandit, gosec).

### Step 10: Report
Update .ai/test-results.md with all results.
Report overall PASS or FAIL to Lead.
List all failures with enough detail to reproduce.
