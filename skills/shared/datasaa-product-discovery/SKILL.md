---
name: datasaa-product-discovery
description: "Reduce the biggest risks fast via experiments/prototypes with pre-committed evidence thresholds and explicit decisions."
---

# datasaa-product-discovery

## Purpose
Reduce the biggest risks fast via experiments/prototypes with pre-committed evidence thresholds and explicit decisions.

## When to use
- Before committing to full build.
- When value/usability/feasibility/viability is uncertain.
- When AI/agent features require trust validation and failure-mode discovery.

## Inputs
### Required
- Problem Brief + success metrics
- Value hypotheses + moments map
- Known constraints/guardrails

### Optional
- Customer access list
- Existing analytics/logs
- Prototype tooling constraints

## Outputs (Definition of Done)
- Discovery Plan (risks ranked; tests mapped; timeline; decision checkpoint)
- Experiment Briefs (hypothesis → method → thresholds → results → decision)
- Prototype Specs (what is mocked vs real; data used; explicit non-scope)
- Decision Log (Proceed / Iterate / Pivot / Kill with evidence)

## Agent Prompt
```md
You are executing **datasaa-product-discovery**.

Goal: produce a discovery plan with prioritized assumptions, plus experiment briefs and a decision log.
Rules:
- Test the highest impact × uncertainty assumptions first.
- Pre-commit evidence thresholds (proceed/kill/inconclusive) before running.
- Prefer the cheapest test that yields the needed evidence (interview → prototype → concierge → thin-slice → pilot).
- Output artifacts in markdown using templates.
```

## Procedure
- Step 1: List assumptions and rank by impact × uncertainty across value/usability/feasibility/viability.
- Step 2: Define evidence thresholds for each top assumption (proceed/kill/inconclusive).
- Step 3: Select cheapest appropriate tests and map each assumption to a test.
- Step 4: Write experiment briefs (including sample, script/tasks, thresholds).
- Step 5: Specify prototypes: what is mocked, what data is used, what is explicitly not built.
- Step 6: After results, record decisions and update the problem/value models.

## Templates
### Discovery Plan
```md
# Discovery Plan — <name>

## Top risks / assumptions (ranked)
1) <assumption> — risk type:
2) ...

## Tests mapped to assumptions
- A1 -> T1
- A2 -> T2

## Timeline
- Week 1:
- Week 2:

## Decision checkpoint
- Date:
- Decisions expected:
```

### Experiment Brief
```md
# Experiment Brief — <name>

## Assumption being tested
- Statement:
- Risk type: Value | Usability | Feasibility | Viability

## Hypothesis
- If we <intervention>, then <observable outcome> because <reason>.

## Method
- Type: interview | prototype | concierge | thin-slice | spike | pilot
- Target users:
- Sample size:
- Script/tasks:

## Evidence thresholds (pre-committed)
- Proceed if:
- Kill if:
- Inconclusive if:

## Results
- Observations:
- Quant signals:
- Surprises:

## Decision
- Proceed | Iterate | Pivot | Kill
- What changes now:
```

## Quality Bar (pass/fail)
- Risks are ranked and tied to assumptions.
- Evidence thresholds are defined before running tests.
- Experiments map 1:1 to assumptions (no generic 'research').
- Every experiment ends with an explicit decision.
- Non-AI baseline is tested/considered for AI features.
- Prototype scope is minimal and explicit (mock vs real).

## Common Failure Modes
- **Discovery as brainstorming (no tests/thresholds)** → Force experiment briefs with proceed/kill criteria.
- **Testing low-risk assumptions first** → Re-rank by impact × uncertainty and reorder work.
- **Prototype turns into mini product build** → Reduce to one moment end-to-end; mock everything else.

## Skill Links
### Upstream
- datasaa-problem-framing
- datasaa-user-value-modeling

### Downstream
- datasaa-system-decomposition
- datasaa-tradeoff-reasoning

## Sources (books)
- INSPIRED (Cagan)
- The Pragmatic Programmer (Hunt/Thomas)
- Building ML Powered Applications (Ameisen)