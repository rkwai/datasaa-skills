---
name: datasaa-client-brief
description: "Write a client brief that keeps the client's own words on top, separate from our assumptions."
---

# datasaa-client-brief

## Why this exists
Early briefs mixed what the client said with what we assumed. Agents downstream treated both as fact. The fix was structural: three sections, and a claim only counts as validated when the client said it.

## Structure
```markdown
# <Client> brief · updated <date>

## 1. In the client's words (validated)
Direct quotes or close paraphrase, each with source. Only things the client said.

## 2. From our people embedded with the client
What our staff observed on site or in their channels. Useful, not validated.

## 3. Internal and unvalidated
Our assumptions, hypotheses and inferences. Each one says how we'd validate it.

## Open questions for the client
Short list, ranked by what blocks work.
```

## Rules
- Never promote a line from section 2 or 3 to section 1 without a new source from the client.
- If section 3 is longer than section 1, say so at the top. That's a signal we're building on guesses.
