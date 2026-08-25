# Technical Decisions Log

Format each decision as:

## DEC-NNN: <title>

- **Date:** YYYY-MM-DD
- **Status:** PROPOSED | ACCEPTED | REJECTED | SUPERSEDED
- **Context:** Why this decision was needed
- **Alternatives:** What else was considered
- **Chosen approach:** What was decided and why
- **Impact:** What this affects
- **Risks:** Known risks
- **Verification:** How to confirm it works

---

## DEC-001: Bootstrap multi-agent team with file-based state

- **Date:** 2026-08-25
- **Status:** ACCEPTED
- **Context:** Need autonomous engineering team coordination without depending on preview teamwork features.
- **Alternatives:** Rely on /teamwork-preview (Ultra plan only, not available); manual agent coordination per-request.
- **Chosen approach:** File-based shared state (.ai/) + custom agent definitions (.agents/agents/) + reusable workflows (.agents/workflows/). Lead orchestrates subagents.
- **Impact:** All agents read/write to .ai/ for coordination. Workflows provide repeatable procedures.
- **Risks:** File-based state is not atomic; Lead must serialize writes carefully.
- **Verification:** Agent team bootstrapped and all files present.
