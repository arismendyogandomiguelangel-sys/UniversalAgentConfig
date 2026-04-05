# AGENTS.md — Universal Agent Configuration
> Model-Agnostic. Read by ALL coding agents working in this project.
> First file any agent reads. Always.

---

## Philosophy: Intelligent Resource Management

> "Any model can write 80% of good code.
>  The remaining 15% is where specialization matters.
>  Token management is not a limitation — it's a discipline."

This repository does not assign rigid roles to models.
It provides a **shared context layer** so any agent can pick up where another left off,
and a **specialization guide** so you spend tokens where they have the most impact.

---

## Session Start Protocol — ANY agent, ALWAYS

Before writing a single line of code, do this:

```
0. Read ECOSYSTEM_SELECTOR.md         → determine project ecosystem first
1. mem_search("current state [project-name]")
2. Read ROADMAP.md                    → where are we?
3. Read .agent/context.md             → what is this project?
4. Read .agent/handoffs/current-state.md  → what was last done?
5. Announce: "Resuming from [X]. Last action: [Y]. Next step: [Z]."
```

Only after this, start working.
A new agent that skips this wastes tokens rediscovering what already exists.

---

## Session End Protocol — BEFORE tokens run out

When you sense context is getting long or tokens are low, stop and do this:

```
1. mem_save(
     title: "Session end — [what was accomplished]",
     type: "session",
     content: "Done: ...\nDecisions: ...\nPending: ...\nNext agent should: ..."
   )
2. Update ROADMAP.md if any milestone changed
3. Write .agent/handoffs/current-state.md:
   - Exact files modified
   - What was decided and why
   - What is the very next step
   - Any gotchas the next agent needs to know
4. Commit work in progress: git add -A && git commit -m "wip: [what you did]"
```

This is not optional. This IS the multi-agent workflow.

---

## Model Specialization Guide

> Not rules. Not rigid assignments.
> A guide for spending tokens with intelligence.

### Claude — The Auditor (use last, use well)
Claude is the best code reviewer available. Use it when:
- The code touches security, auth, payments, sensitive data
- You need to catch subtle bugs, edge cases, race conditions
- Architectural decisions with long-term consequences
- Final review before merging to `main` or deploying to production
- Something feels off and you need a second opinion you can trust

**Token principle:** Don't use Claude to write routine code.
Use Claude to make sure the code that was written is actually correct.
80% of code can be written well by any model. Claude perfects the remaining 15%.

---

### Gemini — Context and Ecosystem (use for breadth)
Gemini excels at:
- Long context tasks (reading an entire codebase at once)
- Google ecosystem: Firebase, GCP, Vertex AI, BigQuery, Workspace
- Web research, current documentation, comparing libraries
- Orchestration: planning, writing specs, breaking down features
- Stitch, Nango, and integration-heavy workflows

**Token principle:** Gemini is your planner and researcher.
It reads everything, proposes solutions, and handles the Google stack.
When tokens get low in Antigravity, save state and switch — don't rush.

---

### Qwen Coder / Any Open Model — The Builder (use for volume)
Good open-source coding models excel at:
- Implementing well-defined specs (when you give them a clear task)
- Repetitive code patterns, boilerplate, CRUD, tests
- Refactors with clear before/after criteria
- When you have a tight token budget and a clear task

**Token principle:** When the spec is clear, any good coding model can implement it.
Save Claude for when the spec is ambiguous or the stakes are high.

---

### The Universal Rule
```
Spec is clear + task is routine    → any model
Task touches production/security   → Claude
Task needs broad research/context  → Gemini
Tokens are low, task is defined    → Qwen or cheapest available
```

---

## Core Workflow: Spec Before Code

For any non-trivial feature (more than ~30 min of work):

```
EXPLORE → SPEC → IMPLEMENT → VERIFY → ARCHIVE
```

These are phases, not agents. Any model can run any phase.
What matters is that each phase produces a file the next agent can read.

| Phase | Output file | Notes |
|-------|-------------|-------|
| Explore | `.agent/specs/[feature]-context.md` | Map of relevant code, no changes |
| Spec | `.agent/specs/[feature]-spec.md` | What to build and why |
| Implement | git commits | Follow spec, commit often |
| Verify | `.agent/handoffs/[feature]-review.md` | Claude preferred here |
| Archive | Engram `mem_save` | Permanent memory |

If you switch models mid-feature, the spec files are the handoff.
The next agent reads the spec, picks up the task, continues.

---

## Memory Protocol (Engram)

All agents share one Engram database per project: `~/.engram/engram.db`

**Save when:**
- You made a non-obvious architectural decision
- You fixed a bug that took more than 15 minutes to find
- You discovered something surprising about the codebase
- End of every session (always)

**Search before:**
- Starting any feature ("has this been attempted before?")
- Making any architectural decision ("what did we decide about X?")
- Session start (always)

**Format:**
```
title:   "[Verb] [what]"              — "Fixed auth token expiry bug"
type:    decision | bugfix | architecture | discovery | pattern | session
content: What: ...\nWhy: ...\nWhere: [files]\nLearned: ...
```

---

## Production Gate (GitHub Actions + Vercel)

This applies when the project is live or going live.

```
feature branch
  → Claude Code review (audit before merge)
    → merge to main
      → GitHub Actions (CI: tests, lint, build)
        → Vercel (deploy)
```

Claude Code review is the gate before `main`.
Not every commit. Only before merge to production branch.
GitHub Actions handles the automated checks — Claude handles the judgment calls.

---

## Files Any Agent Must Know About

```
AGENTS.md                          ← this file — read first, always
ROADMAP.md                         ← current sprint, next milestones
.agent/context.md                  ← what this project is
.agent/conventions.md              ← coding style for this project
.agent/handoffs/current-state.md   ← where we left off
.agent/specs/                      ← feature specs (handoff between phases)
skills/                            ← reusable agent instructions (SKILL.md format)
```

Model-specific config (read after this file):
```
CLAUDE.md          ← Claude Code specifics (MCP, commands, settings)
GEMINI.md          ← Antigravity / Gemini CLI specifics
```

---

## Strict Confidentiality Protocol (CEO Directives)

> **CRITICAL SECURITY RULE**: ALiaNeD respects the strict privacy of executive strategic documentation.
> Any folder containing CEO documentation, project specifications, financial data, or strategic plans (specifically `Doc-CEO/`, `Doc-Arismendy/`, or matching `Doc-*`) must **NEVER** be committed to version control, pushed to GitHub, or published to production environments under any circumstances.
> These files are strictly governed by `.gitignore` rules in development and excluded from any build or deployment steps in production.

---

## What Makes a Good Handoff

When you leave a session, the next agent (even if it's you with a new context)
should be able to read `.agent/handoffs/current-state.md` and answer:

- [ ] What was the last thing completed?
- [ ] What is the very next action to take?
- [ ] Are there any open decisions that still need to be made?
- [ ] What files were last modified?
- [ ] Is anything broken right now?

If your handoff file answers all five questions, it's a good handoff.

---

*TheBest_PowerTeam_Devops — the model doesn't matter. The context does.*
