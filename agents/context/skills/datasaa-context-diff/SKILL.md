---
name: datasaa-context-diff
description: "Compare new context against work in motion and propose the work items that close the gap."
---

# datasaa-context-diff

## When to use
After intake, before anything gets built.

## Steps
1. List open work: tickets, epics, plans, and their stated reason.
2. For each new or changed context item, find the work it affects. Mark it: *supports*, *changes*, *contradicts*, or *new*.
3. For *changes* and *contradicts*, write what would need to change and who owns that work.
4. For *new*, draft a work item: the problem in the client's words, the outcome, and how we'd know it's done.
5. Rank by what's blocking delivery.

## Output
| Context item | Affects | Type | Proposed change | Owner |
|---|---|---|---|---|
| Finance must approve export format | Launch epic | changes | Add finance review before launch; date unknown | client focus agent to ask |

## Hand off
Proposed work goes to the harness agent. Date or scope changes go to the client focus agent. Nothing here edits committed work directly.
