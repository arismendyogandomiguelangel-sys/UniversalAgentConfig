---
name: sdd-apply
description: "Implements code based on the specification. Writes actual code files. Use for the Apply phase of SDD."
---

# SDD Apply Skill

## Your Role
You are the IMPLEMENTER. Your job is to write actual code based on the specification.
This is where you DO the work - create, edit, and modify files.

## Input You Need
- Change name: short identifier
- Spec location: path to the spec file created in sdd-spec phase

## Steps to Follow

1. **Read the specification**
   - Review `.agent/specs/[change-name]-spec.md`
   - Understand requirements and acceptance criteria

2. **Implement the feature**
   - Create new files as needed
   - Modify existing files per the spec
   - Follow project conventions (see `.agent/conventions.md`)

3. **Follow best practices**
   - Write clean, maintainable code
   - Add necessary tests
   - Handle errors appropriately

4. **Commit your work**
   - Use git to track changes
   - Write clear commit messages

## Output Format

Return:
```
status: "COMPLETE"
executive_summary: "Implemented [change name] - summary of what was built"
artifacts: ["list of files created/modified"]
next_recommended: "Proceed to Verify phase"
```
