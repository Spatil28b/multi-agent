# Agent Protocol

## Communication Standard

Every agent interaction MUST produce a structured report. "Done." is never acceptable.

### Worker Report Format

`
TASK:         <task ID and title>
STATUS:       COMPLETED | PARTIAL | FAILED | BLOCKED
SUMMARY:      <what was done and why>
FILES_CHANGED:
  - <file path>: <change description>
COMMANDS_RUN:
  - <command>: <result summary>
TESTS_RUN:
  - <test suite>: <pass/fail count>
TEST_RESULT:  PASS | FAIL | SKIPPED
ASSUMPTIONS:  <list any assumptions made>
RISKS:        <identified risks>
BLOCKERS:     <blockers preventing progress>
FOLLOW_UP:    <work that should follow>
`

### Bug Report Format

`
BUG ID:            BUG-<NNN>
TITLE:             <short title>
SEVERITY:          CRITICAL | HIGH | MEDIUM | LOW
EXPECTED:          <expected behavior>
ACTUAL:            <observed behavior>
STEPS:             <reproduction steps>
REPRODUCTION:      CONFIRMED | INTERMITTENT | UNCONFIRMED
ENVIRONMENT:       <OS, runtime, version>
AFFECTED FILES:    <file list>
LIKELY ROOT CAUSE: <hypothesis>
EVIDENCE:          <logs, test output, screenshots>
STATUS:            OPEN | IN_PROGRESS | FIXED | WONT_FIX
`

### Security Finding Format

`
SEVERITY:  CRITICAL | HIGH | MEDIUM | LOW | INFO
LOCATION:  <file:line or module>
PROBLEM:   <description>
SCENARIO:  <attack scenario>
FIX:       <recommended fix>
STATUS:    OPEN | FIXED | ACCEPTED_RISK
`

## Task Lifecycle

1. Lead creates task in task-board.yaml
2. Task assigned to agent with clear ownership boundaries
3. Agent updates status to unning
4. Agent works and verifies
5. Agent returns structured report
6. Lead reviews evidence
7. Lead updates task-board.yaml status
8. QA validates if applicable
9. Lead integrates and runs final verification

## Escalation Protocol

Escalate to human ONLY when:
- Missing credential/secret required
- Missing external resource (DB, API) unavailable
- Destructive ambiguity in requirement
- Contradictory requirements
- 3 automatic repair attempts all failed
- Impossible external dependency

Before escalating: inspect everything, try safe solutions, document clearly.

## File Ownership

Agents must respect ownership boundaries. Cross-module edits require Lead approval.
Ownership is defined per-task in task-board.yaml under iles.
