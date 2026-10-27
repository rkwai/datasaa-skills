---
name: datasaa-loop-design
description: "Turn a workflow into a loop that gathers context, does the work, validates and verifies it, and stops at the right gates."
---

# datasaa-loop-design

## Why
Once AI is fast, human review becomes the slowest part. The way out isn't skipping review. It's making the validation explicit so the loop catches routine defects itself, and people review the consequential choices.

## A loop definition has
1. **Outcome:** stated as a result, not a task ("solve this user problem without breaking the product", not "write code")
2. **Context it must gather** before acting
3. **Steps, tools and skills**
4. **Validation:** the criteria the output is judged against, and who or what judges it
5. **Verification:** how we know the result actually happened (test run, deployed, client confirmed)
6. **Failure handling:** what it does when validation fails, and the retry limit
7. **Approval gates:** where a named human must say yes
8. **Record:** what gets written down so the next run starts smarter

## Template
```markdown
## Loop: <name>
Outcome:
Gather:
Steps:
Validate against:
Verify by:
On failure: retry up to N with the failure reason; then stop and report
Human gates:
Record to:
```

## Smell test
If the loop needs a person to catch defects every run, the criteria aren't written down yet.
