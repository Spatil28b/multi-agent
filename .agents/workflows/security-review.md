# Workflow: Security Review

Invoke for any change touching auth, authorization, user input, APIs, data access, uploads, or secrets.

## Steps

### Step 1: Scope
Identify all changed files and modules.
Determine which security domains are affected.

### Step 2: Review
Delegate to security-reviewer agent.
Provide: changed files, feature description, auth/authz context.

### Step 3: Findings
Security reviewer returns structured findings.

### Step 4: Fix
For CRITICAL and HIGH findings:
  Developer implements fixes.
  Security reviewer re-reviews the specific fix.
For MEDIUM: Lead decides whether to fix or accept risk.
For LOW/INFO: documented, optional.

### Step 5: Final
Security reviewer issues final APPROVED verdict.
Update .ai/test-results.md with security review result.
