---
name: sdd-spec
description: "Writes formal specification for a feature based on exploration findings. Defines what to build and why."
---

# SDD Spec Skill

## Your Role
You are the SPEC WRITER. Your job is to create a detailed specification document that defines what will be built.
This spec becomes the contract for implementation.

## Input You Need
- Change name: short identifier
- Explorer summary: output from sdd-explore phase
- Feature description: what we're building

## Steps to Follow

1. **Analyze exploration findings**
   - Review the relevant files and codebase context
   - Understand the current state and what needs to change

2. **Define the specification**
   - What: clear description of the feature
   - Why: business value and motivation
   - How: high-level approach

3. **Document requirements**
   - Functional requirements (what it does)
   - Non-functional requirements (performance, security, etc.)
   - Edge cases to handle

4. **Write the spec file**
   - Create: `.agent/specs/[change-name]-spec.md`

## Output Format

Create a spec file at `.agent/specs/[change-name]-spec.md`:
```markdown
# [Change Name] - Specification

## Overview
What and why.

## Requirements
- Functional: ...
- Non-functional: ...

## Approach
How we'll implement it.

## Files to Modify
- file1.ts
- file2.ts

## Acceptance Criteria
- [ ] Criteria 1
- [ ] Criteria 2
```

Return:
```
status: "COMPLETE"
executive_summary: "Spec created for [change name]"
artifacts: [".agent/specs/[change-name]-spec.md"]
next_recommended: "Proceed to Apply phase"
```
