# 🤖 Autonomous Multi-Agent Engineering Team

A production-grade, multi-role autonomous software engineering system for Antigravity IDE and Claude Code.

---

## 🌟 Two Ways to Use

### ⚡ Mode 1: 100% Autonomous Hands-Free Mode (Recommended)
Run the entire 7-role engineering team inside **ONE single IDE window** without switching windows or typing "check":

```text
Implement [feature description] using the full autonomous-feature workflow end-to-end.
```

The system autonomously cycles through:
1. 📐 **Architect** — Analyzes dependencies & designs architecture.
2. 💻 **Developer** — Implements code & unit tests.
3. 🕵️ **QA** — Runs adversarial tests & logs edge case bugs.
4. 🔧 **Bug Fixer** — Repairs defects with regression tests.
5. 🛡️ **Security Reviewer** — Scans for vulnerabilities & permission leaks.
6. 📋 **Code Reviewer** — Audits maintainability & cleanliness.
7. 👑 **Lead Orchestrator** — Verifies builds and delivers the final report.

---

### 🪟 Mode 2: Multi-Window Isolated Workspace Mode
For large projects requiring separate directory isolation across multiple windows:

1. **Create separate folders:**
   ```powershell
   .\scripts\setup-agent-workspaces.ps1
   ```
2. **Start polling monitors:**
   ```powershell
   .\scripts\start-all-poll-loops.ps1
   ```
3. Open each folder in a separate IDE window (`main-agent`, `sub-agents/architect`, etc.) and paste their activation prompts from `.agents/activation/`.

---

## 👥 The Agent Team

| Agent | Role | Responsibility |
|---|---|---|
| **lead** | Orchestrator | Coordinates delivery pipeline & final verification |
| **architect** | Architecture Specialist | Analyzes system design, interfaces & planning |
| **developer** | Implementation Specialist | Writes production code & unit tests |
| **qa** | QA & Adversarial Tester | Breaks implementations & uncovers bugs |
| **bug-fixer** | Root Cause Repair | Diagnoses & fixes defects with regression tests |
| **security-reviewer** | Security Auditor | Audits auth, input validation, secrets & APIs |
| **code-reviewer** | Code Quality Judge | Enforces coding standards, cleanliness & review |

---

## 📂 Shared Memory (`.ai/`)

All agents coordinate through structured persistent files:
* `.ai/project-profile.md` — Detected technology stack & constraints
* `.ai/project-state.md` — High-level team progress
* `.ai/task-board.yaml` — Active task tracker & dependencies
* `.ai/architecture.md` — Architectural specifications
* `.ai/decisions.md` — Architecture Decision Records (ADRs)
* `.ai/bugs.md` — Bug tracking & root causes
* `.ai/test-results.md` — Verification test logs
* `.ai/current-work.md` — Active feature context

---

## 🚀 Workflows (`.agents/workflows/`)

* `/autonomous-feature` — Full end-to-end feature delivery pipeline.
* `/bug-hunt` — Targeted bug reproduction & fix verification.
* `/full-verify` — Universal multi-layer test suite execution.
* `/security-review` — Dedicated security & vulnerability audit.
* `/code-review` — Final code quality & architectural sign-off.