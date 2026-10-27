---
name: datasaa-iterative-delivery
description: "Ship thin vertical slices with hypotheses, instrumentation, safe rollouts, and learning loops that update the backlog based on evidence."
---

# datasaa-iterative-delivery

## Purpose
Ship thin vertical slices with hypotheses, instrumentation, safe rollouts, and learning loops that update the backlog based on evidence.

## When to use
- Planning delivery after discovery + architecture.
- Scaling from prototype to production.
- Incrementally increasing agent autonomy.

## Inputs
### Required
- Moments that matter + value hypotheses
- Guardrails + rollout constraints
- Observability and evaluation requirements

### Optional
- Release cadence constraints
- Customer beta programs
- Change management requirements

## Outputs (Definition of Done)
- Thin-Slice Delivery Plan (vertical slices tied to metrics)
- Slice Artifact Checklist (product, eng, ops, AI constraints)
- Release Plan (flags, staged rollout, rollback triggers, owner)
- Iteration Review Note (expected vs observed + decisions)
- Backlog Reconciliation (updated priorities and kills)

## Agent Prompt
```md
You are executing **datasaa-iterative-delivery**.

Produce a delivery plan with vertical slices, each with a hypothesis, instrumentation, and safe rollout.
Rules:
- Slices must be user-value vertical (not layer-based).
- Every slice has a measurable hypothesis + guardrails.
- Every slice includes feature flags and rollback triggers.
- After shipping, write an iteration review and update the backlog based on evidence.
```

## Procedure
- Step 1: Define vertical slices anchored to user moments (assist before automate; draft before execute).
- Step 2: Attach a measurable hypothesis to each slice (expected metric delta within timeframe).
- Step 3: Create a slice checklist: UX + trust controls + tests + flags + dashboards + runbooks.
- Step 4: Plan staged rollout and rollback triggers; assign owners.
- Step 5: Ship a walking skeleton early; deepen iteratively.
- Step 6: Run iteration review: expected vs observed; categorize and decide proceed/iterate/pivot/kill.
- Step 7: Reconcile backlog: remove work that doesn't move metrics; prioritize evidence-backed bets.

## Templates
### Thin-Slice Plan
```md
# Thin-Slice Delivery Plan — <feature>

Slice 1: <name>
- User moment:
- Change:
- Hypothesis (metric delta):
- Guardrails:
- Instrumentation:
- Flag + rollout:
- Rollback trigger:
- Required artifacts:

Slice 2: ...
```

### Iteration Review
```md
# Iteration Review — <date> — <slice/version>

What shipped:
- ...

Expected impact:
- Metric expected Δ by T:

Observed:
- Metric moved:
- Guardrails:
- Safety signals:
- Cost impact:

Learnings:
- Right:
- Wrong/surprises:
- Follow-ups:

Decision:
- Proceed | Iterate | Pivot | Kill
```

## Quality Bar (pass/fail)
- Slices are vertical (user-value), not horizontal (layers).
- Each slice has a hypothesis + measurement plan.
- Flags + staged rollout + rollback triggers exist for each slice.
- Instrumentation ships with slices (not later).
- Iteration reviews update backlog based on evidence.

## Common Failure Modes
- **Big-bang delivery** → Force walking skeleton + thin vertical slices; stage autonomy.
- **Velocity without learning** → Require hypothesis + measurement + review per slice.
- **Ops debt accumulates** → Checklist gating: dashboards/runbooks/rollback mandatory.

## Skill Links
### Upstream
- datasaa-product-discovery
- datasaa-system-observability
- datasaa-human-in-the-loop-design

### Downstream
- (none)

## Sources (books)
- The Pragmatic Programmer (Hunt/Thomas)
- INSPIRED (Cagan)
- Clean Code (R. Martin)