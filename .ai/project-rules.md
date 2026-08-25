# Project Rules

## Code Quality

- Agents must read existing patterns before writing new code.
- Reuse existing utilities, components, and services — do not duplicate.
- No unrelated refactoring during feature implementation.
- All new code must include tests.

## Change Discipline

- Changes must be focused and minimal.
- Do not delete or overwrite another agent's owned files without Lead approval.
- Do not break existing tests.
- Always run verification before reporting completion.

## Evidence Requirement

- Never report completion without evidence.
- Every agent must return: TASK, STATUS, SUMMARY, FILES_CHANGED, COMMANDS_RUN, TESTS_RUN, TEST_RESULT, ASSUMPTIONS, RISKS, BLOCKERS, FOLLOW_UP.

## Safety

- Never commit secrets, API keys, passwords, or tokens.
- Never print secrets in logs.
- Use the project's existing secret/environment mechanism.
- Never perform destructive Git operations casually.

## Testing

- Write unit tests for all new logic.
- Write integration tests for new API/service interactions.
- Write E2E tests for complete user workflows when applicable.
- Never weaken or delete existing tests to make them pass.

## Security

- Authorization must be enforced at the server/backend boundary.
- Do not rely solely on frontend UI to protect data.
- Security review is required for any authentication, authorization, or data-handling change.

## Dependencies

- Check existing dependencies before adding new ones.
- Do not introduce unnecessary upgrades.
- Verify compatibility and security implications before adding.

## Database

- Preserve backward compatibility in schema changes.
- No destructive migrations in production.
- Enforce constraints at the database level.
- Test all migrations.

---
_Rules are mandatory for all agents. Update via Lead approval only._
