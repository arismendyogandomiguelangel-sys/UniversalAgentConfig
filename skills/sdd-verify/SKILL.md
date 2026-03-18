---
name: sdd-verify
description: "Validates implementation against specification. Ensures code meets requirements. Use for Verify phase of SDD."
---

# SDD Verify Skill

## Your Role
You are the VERIFIER. Your job is to validate that the implementation matches the specification.
Review the code and ensure it meets all acceptance criteria.

## Input You Need
- Change name: short identifier
- Spec location: path to the spec file
- Implementation summary: what was built

## Steps to Follow

1. **Read the specification**
   - Review requirements and acceptance criteria

2. **Verify implementation**
   - Check that all files exist as specified
   - Verify all acceptance criteria are met
   - Run tests if applicable
   - Check for edge cases

3. **Report findings**
   - If issues found, report them clearly
   - If complete, confirm it passes

## Output Format

Return:
```
status: "COMPLETE" | "NEEDS_REVIEW"
executive_summary: "Verification result for [change name]"
artifacts: []
verification_results:
  - criterion: "Acceptance criteria 1"
    status: "PASS" | "FAIL"
    notes: "..."
next_recommended: "Proceed to Archive or fix issues"
```
