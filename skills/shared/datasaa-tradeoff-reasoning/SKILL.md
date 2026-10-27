---
name: datasaa-tradeoff-reasoning
description: "Make and document high-quality decisions under constraints using explicit option comparison, consequences, and validation plans."
---

# datasaa-tradeoff-reasoning

## Purpose
Make and document high-quality decisions under constraints using explicit option comparison, consequences, and validation plans.

## When to use
- Choosing architecture, data consistency, model/modality, rollout strategy, or permissions.
- When decisions are costly to reverse ('one-way doors').
- When stakeholders need a clear, non-technical rationale.

## Inputs
### Required
- Decision statement (what must be decided + why)
- Constraints/guardrails (latency, cost, privacy, safety, reliability)
- At least 2 options + baseline

### Optional
- Rough cost estimates
- Operational constraints (oncall, compliance)
- Prior ADRs for consistency

## Outputs (Definition of Done)
- ADR (context, options, decision, consequences, revisit conditions)
- Tradeoff Table (2–6 options incl. baseline across key dimensions)
- Validation Plan (metrics, rollout, rollback triggers)
- Stakeholder Summary (1 paragraph)

## Agent Prompt
```md
You are executing **datasaa-tradeoff-reasoning**.

Create an ADR for the decision, including a tradeoff table and validation/rollout plan.
Rules:
- Include a 'do nothing / baseline' option.
- Keep options to 2–6; avoid option overload.
- Tie evaluation dimensions to product outcomes + guardrails.
- State sacrifices explicitly and define revisit triggers.
- Output as markdown using the ADR template.
```

## Procedure
- Step 1: Restate the decision in one sentence (X to achieve Y without violating Z).
- Step 2: Classify as one-way vs two-way door (rigor vs speed).
- Step 3: Enumerate 2–6 options including baseline; note key unknowns.
- Step 4: Define evaluation dimensions (value, trust/UX, feasibility, viability, reliability, maintainability, AI risks).
- Step 5: Fill tradeoff table with estimates + uncertainty; choose option and document sacrifices.
- Step 6: Attach validation plan: rollout, monitoring, rollback triggers, and revisit conditions.
- Step 7: Write stakeholder summary in plain language.

## Templates
### ADR
```md
# ADR-<id>: <decision title>
Date:
Owner:
Status: Proposed | Accepted | Deprecated

## Context
- Problem:
- Goals (north-star):
- Guardrails:

## Options considered
1) Option A:
2) Option B:
3) Baseline / Do nothing:

## Tradeoff table
Dimension | A | B | Baseline
---|---|---|---
User value |  |  |
Trust/UX |  |  |
Feasibility |  |  |
Viability (cost/legal) |  |  |
Reliability |  |  |
Maintainability |  |  |
AI risks (eval/drift/safety) |  |  |

## Decision
- Chosen option:
- Why it wins:
- Sacrifices accepted:

## Consequences
- Easier:
- Harder:
- Risks accepted:

## Validation plan
- Success metrics:
- Monitoring/alerts:
- Rollout plan:
- Rollback triggers:

## Revisit conditions
- Reconsider if:
```

## Quality Bar (pass/fail)
- Baseline option included.
- Decision tied to measurable outcomes + guardrails.
- Sacrifices and consequences explicit.
- Validation plan includes rollout + rollback triggers.
- ADR readable in <5 minutes for a newcomer.

## Common Failure Modes
- **Decision by slogan ('best practice')** → Force tradeoff table + measurable constraints.
- **No rollback plan** → Add quantitative rollback triggers and a staged rollout.
- **Fake certainty** → Record uncertainty and convert into validation steps.

## Skill Links
### Upstream
- datasaa-system-decomposition
- datasaa-product-discovery

### Downstream
- datasaa-data-centric-design
- datasaa-ml-systemization
- datasaa-agent-orchestration

## Sources (books)
- Designing Data-Intensive Applications (Kleppmann)
- INSPIRED (Cagan)
- Designing ML Systems (Huyen)