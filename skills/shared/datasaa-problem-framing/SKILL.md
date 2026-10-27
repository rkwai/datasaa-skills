---
name: datasaa-problem-framing
description: "Convert messy context into a crisp, testable problem definition with measurable outcomes and explicit constraints."
---

# datasaa-problem-framing

## Purpose
Convert messy context into a crisp, testable problem definition with measurable outcomes and explicit constraints.

## When to use
- Starting a new product/feature/agent capability.
- Requirements are vague, conflicting, or solution-first ('use an agent/RAG').
- Before discovery, architecture, or implementation work.

## Inputs
### Required
- Primary user segment + usage context
- Business objective + timeframe ('why now?')
- Known constraints (budget, privacy/compliance, performance/SLOs)

### Optional
- Baseline metrics or current workaround data
- Prior attempts / lessons learned
- Existing competitors/alternatives

## Outputs (Definition of Done)
- Problem Brief (≤2 pages): user, context, problem, impact, non-goals, constraints, open questions
- Success Metrics Spec: north-star + leading indicators + guardrails
- Risk Register: value/usability/feasibility/viability + AI risks (data/eval/trust/safety)

## Agent Prompt
```md
You are executing **datasaa-problem-framing**.

Goal: produce (1) a Problem Brief, (2) a Success Metrics Spec, and (3) a Risk Register.
Rules:
- Do NOT propose solutions until the 'Solution Modality Check' section.
- Ask up to 7 clarifying questions ONLY if required inputs are missing.
- Include a non-AI baseline to beat.
- Include explicit constraints (latency/cost/privacy/safety) and non-goals.
- Output the artifacts as markdown using the provided templates.
```

## Procedure
- Step 1: Name the primary user(s) and the workflow moment (job-to-be-done + current workaround).
- Step 2: Write a 3-line problem statement: User / Problem / Impact (measurable). Avoid solution words.
- Step 3: Define success: north-star + leading indicators + guardrails (latency/cost/safety).
- Step 4: List constraints and explicit non-goals (what/whom you will not solve now).
- Step 5: Run a 'Solution Modality Check': non-AI baseline, AI assist, AI automation (no commitment yet).
- Step 6: Create a risk register: value/usability/feasibility/viability + AI risks (data/evaluation/trust/safety).
- Step 7: Finalize a readable brief (tight, skimmable, decision-oriented).

## Templates
### Problem Brief
```md
# Problem Brief — <name>

## 1) Context / Why now
- ...

## 2) Target user(s)
- Primary:
- Secondary:
- Excluded users:

## 3) Current workflow + pain
- Today’s steps:
- Workarounds:
- Pain (measurable):

## 4) Problem statement
- User:
- Problem:
- Impact:

## 5) Desired outcomes
- User outcome:
- Business outcome:

## 6) Success metrics
- North-star:
- Leading indicators:
- Guardrails (cost/latency/safety/etc.):

## 7) Constraints
- Product:
- Engineering:
- Data:
- Legal/Privacy:
- Time/Budget:

## 8) Non-goals
- ...

## 9) Solution modality check
- Non-AI baseline:
- AI assist:
- AI automation:

## 10) Risks & unknowns
- Value / Usability / Feasibility / Viability:
- Data / Eval / Trust / Safety:

## 11) Open questions
- ...
```

### Risk Register
```md
# Risk Register — <name>

Risk | Type (Value/Usability/Feasibility/Viability/Data/Eval/Trust/Safety) | Evidence now | How we’ll test | Owner
---|---|---|---|---
<risk> | <type> | <what we know> | <experiment/analysis> | <who>
```

## Quality Bar (pass/fail)
- Primary user and moment-of-use are named (not 'everyone').
- Problem statement contains no embedded solution.
- North-star + guardrails are measurable and concrete.
- Non-goals and constraints are explicit.
- A non-AI baseline is stated.
- Risk register includes 4 risks + AI risks.
- Output is skimmable and actionable (<2 pages for brief).

## Common Failure Modes
- **Solution-first framing ('build an agent')** → Rewrite as User/Problem/Impact; move solution ideas to modality check.
- **Vanity metrics / no guardrails** → Add behavioral metrics + cost/latency/safety guardrails with thresholds.
- **No baseline** → Define the simplest non-AI or manual workflow baseline to beat.
- **Undefined constraints** → Force concrete numbers (p95 latency, $/day, privacy requirements, blast radius).

## Skill Links
### Upstream
- (none)

### Downstream
- datasaa-user-value-modeling
- datasaa-product-discovery
- datasaa-system-decomposition

## Sources (books)
- INSPIRED (Cagan)
- The Art of AI Product Development (Lipenkova)
- Building ML Powered Applications (Ameisen)
- Designing ML Systems (Huyen)