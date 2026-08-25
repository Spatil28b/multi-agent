# Engineering Rules

These rules apply to all agents on this project.
They supplement .ai/project-rules.md with operational detail.

## Evidence Requirement
- Every agent report must include COMMANDS_RUN and TEST_RESULT.
- Done. without evidence is a violation.
- Status COMPLETED requires verified passing tests.

## No-Guess Rule
- Never fabricate test results, file paths, API responses, or command output.
- If uncertain: INSPECT -> VERIFY -> ACT.
- If something cannot be verified, state it explicitly.

## No-Random-Refactor Rule
- Do not rewrite unrelated modules.
- Do not change architecture without explicit Lead approval.
- Do not clean up unrelated code during a feature.

## Ownership Rule
- Each task has defined file ownership in task-board.yaml.
- Cross-ownership edits require Lead coordination.
- Never casually overwrite another agent's changes.

## Dependency Rule
- Check existing dependencies before adding new ones.
- Prefer existing libraries over new additions.
- Document justification for any new dependency.

## Secret Rule
- Never commit secrets, API keys, tokens, passwords, or private keys.
- Use the project's environment mechanism.
- Never print secrets in logs or test output.

## Database Rule
- Preserve backward compatibility.
- No destructive changes to production data.
- All migrations must be tested.
- Rollback plan must exist for schema changes.

## Bug Loop Rule
- Maximum 3 automatic fix attempts per bug.
- After 3 failures: escalate to human with full investigation.
- Never fix by weakening or deleting tests.

## Parallelism Rule
- Independent work MUST run concurrently.
- Never parallelize work that shares files.
- Maximum 6-8 concurrent agents by default.

## Communication Rule
- All inter-agent communication is via structured reports.
- All task state is tracked in .ai/task-board.yaml.
- .ai/ files are the source of truth for project state.
