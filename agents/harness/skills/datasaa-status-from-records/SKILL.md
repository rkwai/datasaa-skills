---
name: datasaa-status-from-records
description: "Generate status from tickets, dates and decisions instead of keeping a second tracker by hand."
---

# datasaa-status-from-records

## Rules
- Status is generated, never hand-maintained. A hand-kept tracker drifts from the real one.
- Every item names an owner.
- Items the accountable human owns come with a recommendation.
- Items other people own get tagged to them and go no further.
- A recurring must-fix item keeps showing up until it's fixed or someone writes down why it's deferred.

## Output
```markdown
# Status · generated 2026-10-12 17:00
## Done since last
- Export format draft (ticket 41), merged 10/11
## Needs you
- Finance review date unknown. Recommend: ask in Thursday sync. (owner: you)
## Waiting on others
- Sample data file (@client-data-lead)
## Must-fix, recurring (3rd week)
- Flaky import test. Deferred? No reason recorded.
```
