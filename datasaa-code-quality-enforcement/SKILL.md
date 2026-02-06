---
name: datasaa-code-quality-enforcement
description: "Produce maintainable, reviewable, safe code changes: readable diffs, tests, verification evidence, and architecture-respecting implementation."
---

# datasaa-code-quality-enforcement

## Purpose
Produce maintainable, reviewable, safe code changes: readable diffs, tests, verification evidence, and architecture-respecting implementation.

## When to use
- Any time an agent produces a patch/PR.
- Before merging changes to shared codebases.
- When refactoring or touching risky areas (auth, money, concurrency, data deletion).

## Inputs
### Required
- Change request + acceptance criteria
- Repo conventions (format/lint/typecheck/test)
- Architecture/module boundaries (if any)

### Optional
- CI pipeline details
- Performance/security constraints
- Release/rollback requirements

## Outputs (Definition of Done)
- Change Plan (smallest diff; risks; test plan)
- Patch/PR (clean diff; conventions respected)
- Tests (regression + edge cases as needed)
- Verification Evidence (commands + results)
- Refactor Notes (if refactor)
- PR Summary (what/why/how to verify/risks/rollback)

## Agent Prompt
```md
You are executing **datasaa-code-quality-enforcement**.

Deliver a review-ready PR: plan, minimal diff, tests, verification evidence, and summary.
Rules:
- Match repo conventions; do not introduce new style.
- Keep diffs minimal; split PRs when necessary.
- Add tests for changed behavior (or justify why not).
- Include verification evidence (format/lint/typecheck/tests).
- Output PR summary + checklist.
```

## Procedure
- Step 1: Discover repo quality contract (format/lint/typecheck/tests) and architecture boundaries.
- Step 2: Write a short change plan (scope, files, risks, tests, rollback).
- Step 3: Implement with readability: intent-revealing names, small functions, clear errors.
- Step 4: Respect architecture boundaries; introduce interfaces instead of reaching across layers.
- Step 5: Add tests: regression for bugs; edge cases; integration tests where needed.
- Step 6: Run verification suite; capture outputs.
- Step 7: Write PR summary with how-to-verify + risks + rollback.

## Templates
### PR Summary
```md
## Summary
- What changed:
- Why:

## How to test
- Commands:
- Expected results:

## Risks & mitigations
- Risk areas:
- Mitigations:
- Rollback plan:

## Notes
- Edge cases handled:
- Follow-ups:
```

### Change Plan
```md
Change type: feature | bugfix | refactor | perf | cleanup

Plan:
1) ...
2) ...

Tests to add/update:
- ...

Verification:
- format:
- lint:
- typecheck:
- unit:
- integration:

Risks + mitigations:
- ...
```

## Quality Bar (pass/fail)
- Diff is minimal and consistent with codebase conventions.
- Tests cover new/changed behavior (or strong rationale).
- Formatting/lint/typecheck/tests pass; evidence included.
- Architecture boundaries respected; no hidden coupling.
- PR summary enables validation without reading every line.

## Common Failure Modes
- **Huge PR** → Split into refactor prep → behavior change → cleanup.
- **Over-abstraction** → Keep interfaces minimal; abstract only when repetition is proven.
- **Under-testing** → Add regression tests + edge-case tests; prove refactor safety.

## Skill Links
### Upstream
- datasaa-system-decomposition

### Downstream
- datasaa-system-observability
- datasaa-iterative-delivery

## Sources (books)
- Clean Code (R. Martin)
- The Pragmatic Programmer (Hunt/Thomas)