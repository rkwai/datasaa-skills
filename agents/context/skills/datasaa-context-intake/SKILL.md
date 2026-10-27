---
name: datasaa-context-intake
description: "Sort new meetings, chat and email into the context record with a source on every line."
---

# datasaa-context-intake

## When to use
New material arrived: a transcript, a thread, a batch of support issues.

## Steps
1. Read the new material end to end. Don't skim for keywords.
2. Pull out statements that matter: needs, problems, decisions, deadlines, constraints, objections.
3. Tag each one with its source (file + timestamp or message) and who said it.
4. Place it in the context record under the right heading. If it contradicts something already there, keep both and flag it.
5. Write a 3-line summary at the top of the intake log: what's new, what's contradicted, what's still unknown.

## Output
```markdown
### Intake 2026-10-12 · source: weekly-sync transcript
- [client] "We can't launch until finance signs off on the export format." (14:05)
- [ours]   Assumed export = CSV. Not confirmed.
- CONFLICT: roadmap says launch 10/30; finance sign-off has no date.
```

## Checks before handing off
- Every line has a source. No source, no line.
- Nothing is marked validated here. That's the brief's job, and only with the client's words.
