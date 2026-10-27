---
name: datasaa-user-value-modeling
description: "Model the user journey, value hypotheses, adoption/trust needs, and measurement plan so work stays anchored to outcomes."
---

# datasaa-user-value-modeling

## Purpose
Model the user journey, value hypotheses, adoption/trust needs, and measurement plan so work stays anchored to outcomes.

## When to use
- After problem framing, before discovery and architecture.
- When building AI/agent features that require trust + control surfaces.
- When success metrics exist but value mechanisms are unclear.

## Inputs
### Required
- Problem Brief + success metrics
- Primary user(s) and workflow context
- Business outcome goal

### Optional
- Existing funnel/usage analytics
- Customer interview notes
- Competitive alternatives

## Outputs (Definition of Done)
- User Journey + 'Moments that Matter' map
- Value Hypothesis Sheet (user behavior change + business impact)
- Adoption + Trust Plan (controls, transparency, escalation/undo)
- Measurement Plan (offline + online signals; guardrails)

## Agent Prompt
```md
You are executing **datasaa-user-value-modeling**.

Produce: (1) Journey + Moments map, (2) Value Hypothesis Sheets, (3) Adoption+Trust Plan, (4) Measurement Plan.
Rules:
- Express value as *observable behavior change*.
- For each moment, choose a modality candidate: non-AI baseline vs AI assist vs AI automation.
- Include trust controls (review/undo/escalate) and how adoption will be earned.
- Output artifacts in markdown using templates.
```

## Procedure
- Step 1: Map the current user journey (trigger → steps → done) and identify pain points.
- Step 2: Select 3–7 'moments that matter' (decision points, bottlenecks, high-risk steps).
- Step 3: For each moment, write user + business value hypotheses (behavior change + KPI impact).
- Step 4: Choose modality candidates per moment (baseline vs assist vs automation).
- Step 5: Design adoption + trust: transparency, controls, overrides, escalation, feedback loops.
- Step 6: Define measurement: offline checks where needed and online behavioral proxies; include guardrails.

## Templates
### Journey
```md
# Journey + Moments Map — <name>

## Journey steps
1) ...
2) ...
3) ...

## Moments that matter
- M1: <decision/bottleneck/risk> — why it matters
- M2: ...
```

### Value Hypothesis
```md
# Value Hypothesis — <moment name>

## User + context
- User:
- Trigger:
- Current pain (measurable):

## Hypothesis
- If we <intervention>, then users will <observable behavior> because <reason>.

## Business impact
- Metric impacted:
- Expected direction + magnitude (estimate):
- Why this is credible:

## Modality options
- Non-AI baseline:
- AI assist:
- AI automation:
- Candidate + rationale:

## Adoption + trust requirements
- Transparency:
- Controls (review/undo/override):
- Escalation rules:
- Feedback captured:

## Measurement
- Offline eval (if any):
- Online proxies:
- Guardrails:
```

## Quality Bar (pass/fail)
- Journey exists; work is not feature-first.
- Each moment has a value hypothesis with observable behavior change.
- Business impact is stated (viability not ignored).
- Each moment includes a non-AI baseline.
- Trust/adoption controls are explicit (not implied).
- Measurement includes online behavioral proxies + guardrails.

## Common Failure Modes
- **Feature soup (no workflow anchoring)** → Rewrite as journey + moments; map each feature to a moment.
- **Trust is implicit** → Add review/undo/escalate controls and clear user-facing limitations.
- **Metrics are offline-only** → Add online proxies (accept/edit/undo/escalation/time-to-complete).

## Skill Links
### Upstream
- datasaa-problem-framing

### Downstream
- datasaa-product-discovery
- datasaa-human-in-the-loop-design

## Sources (books)
- INSPIRED (Cagan)
- The Art of AI Product Development (Lipenkova)
- Designing ML Systems (Huyen)