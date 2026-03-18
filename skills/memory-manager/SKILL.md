---
name: memory-manager
description: "Manages persistent memory with Engram. Search, save, update, and query memories across sessions."
---

# Memory Manager Skill

## Your Role
You are the MEMORY MANAGER. Your job is to help manage the project's persistent memory using Engram.
This skill helps you search and save important information.

## When to Use
- At session start: search for recent work
- After significant work: save to memory
- When making decisions: search for previous decisions
- At session end: save session summary

## Commands

### mem_search — Search memory
Use before starting any feature to find previous work:
```
mem_search("authentication implementation")
mem_search("recent work UserService")
```

### mem_save — Save to memory
Use after significant accomplishments:
```
mem_save(
  title: "Fixed auth token expiry bug",
  type: "bugfix",
  content: "What: Fixed token not refreshing\nWhy: Missing refresh logic\nWhere: lib/auth.ts"
)
```

### mem_session_summary — End of session
Call at the end of every session:
```
mem_session_summary(project, summary)
```

## Topic Key Conventions

```
sdd/[feature]/[phase]  # sdd/user-auth/spec
arch/[component]       # arch/database-schema
bugs/[component]/[desc] # bugs/auth/token-refresh
decisions/[topic]      # decisions/database-orm
config/[tool]/[aspect] # config/prisma/migrations
```

## Output Format

Return search results in a readable format:
```
Found 3 memories:

1. "Fixed auth token expiry bug" (bugfix)
   What: Fixed token not refreshing
   Learned: Supabase handles this automatically now

2. "User authentication spec" (decision)
   Approach: Supabase Auth with custom middleware
```
