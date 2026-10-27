---
name: datasaa-harness-step
description: "Place one bounded AI job at a specific step inside an existing workflow, with an inspectable output."
---

# datasaa-harness-step

## When to use
You want AI in the workflow, not beside it. Start narrow.

## Pick the step
Good first steps: the context is already available, the output is easy to inspect, the consequences are understood. PR review, ticket refinement, test planning and release notes usually qualify.

## Define it
```markdown
## Harness: PR review prep
Trigger:   PR opened or updated
Reads:     the diff, repo rules (AGENTS.md), linked ticket, test results
Job:       flag likely problems against the rules; draft review comments
Output:    one review comment block, each finding tied to a rule or test
Human:     the engineer owns the decision to merge
Not allowed: approving, merging, pushing to the branch
```

## Check
- Can a reviewer verify every finding in under a minute? If not, the output is too vague.
- Does it stop making someone rebuild the same context every time? That's the point.
