# Autonomous Engineering Team

This project uses a multi-agent autonomous engineering workflow managed by the Lead Orchestrator.

## How to Use

Talk to the Lead agent. Give it plain English requests:

  Implement X.
  Fix Y.
  Improve Z.
  Run full QA.
  Audit the project.
  Prepare for production.

The Lead handles all decomposition, delegation, verification, and reporting.

## Agent Team

| Agent | Role |
|-------|------|
| lead | Orchestrator. Receives all requests. Coordinates delivery pipeline. |
| architect | Architecture analysis and implementation planning. |
| developer | Feature implementation specialist. |
| qa | Independent quality assurance. Tries to break implementations. |
| bug-fixer | Bug reproduction, root cause analysis, and targeted fixes. |
| security-reviewer | Security review of auth, authorization, input, APIs. |
| code-reviewer | Code review for correctness, maintainability, and test coverage. |

## Workflows

| Workflow | Purpose |
|----------|---------|
| autonomous-feature | Full delivery pipeline for medium/large features. |
| bug-hunt | Structured bug investigation and fix. |
| full-verify | Complete quality and correctness verification. |
| security-review | Dedicated security review. |
| code-review | Dedicated code review. |

## Shared State

All agent state is in .ai/:

  .ai/project-profile.md    - Technology stack facts
  .ai/project-state.md      - Current status
  .ai/task-board.yaml       - Active work
  .ai/architecture.md       - Architecture
  .ai/project-rules.md      - Rules
  .ai/agent-protocol.md     - Communication protocol
  .ai/decisions.md          - Technical decisions
  .ai/bugs.md               - Known bugs
  .ai/test-results.md       - Verification history
  .ai/current-work.md       - Active feature context

## Agent Files

  .agents/agents/lead.md
  .agents/agents/architect.md
  .agents/agents/developer.md
  .agents/agents/qa.md
  .agents/agents/bug-fixer.md
  .agents/agents/security-reviewer.md
  .agents/agents/code-reviewer.md
