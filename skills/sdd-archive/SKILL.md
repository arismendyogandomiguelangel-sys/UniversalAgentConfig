---
name: sdd-archive
description: "Saves final state to persistent memory. Uses Engram to store the feature completion for future reference."
---

# SDD Archive Skill

## Your Role
You are the ARCHIVER. Your job is to save the final state of the feature to persistent memory.
This ensures future agents can find what was built.

## Input You Need
- Change name: short identifier
- Final summary: brief description of what was built

## Steps to Follow

1. **Call mem_save to Engram**
   - Use the Engram MCP tool to save the feature completion
   - Include: what was built, key decisions made, any gotchas

2. **Update ROADMAP.md**
   - Mark the feature as completed in the project roadmap

3. **Update current-state.md**
   - Document what was completed for the next agent

## Output Format

Call mem_save with:
```
title: "[Verb] + [what]" - "Completed user authentication feature"
type: "feature"
content: |
  What: Built user authentication with Supabase Auth
  Why: Required for protected routes and user personalization
  Where: components/Auth/, lib/auth.ts, api/auth/
  Learned: Supabase Auth handles session refresh automatically
```

Return:
```
status: "COMPLETE"
executive_summary: "Archived [change name] to Engram"
artifacts: []
next_recommended: "Feature complete"
```
