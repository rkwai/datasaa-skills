---
name: datasaa-ml-systemization
description: "Design an ML/LLM feature as an end-to-end production system: baseline, eval, deployment, monitoring, and iteration loops tied to outcomes."
---

# datasaa-ml-systemization

## Purpose
Design an ML/LLM feature as an end-to-end production system: baseline, eval, deployment, monitoring, and iteration loops tied to outcomes.

## When to use
- Whenever ML/LLM is part of the solution (prompt, RAG, fine-tune, tools).
- Before shipping AI to production.
- When evaluation and monitoring need to be planned up-front.

## Inputs
### Required
- Problem + success metrics + guardrails
- Data contracts/quality + feedback plan
- Deployment environment + operational constraints

### Optional
- Candidate models/providers
- Existing evaluation sets
- Cost budgets and expected volume

## Outputs (Definition of Done)
- ML/LLM System One-Pager (goal, modality, I/O contract, constraints)
- Baseline Spec (non-AI or simplest AI baseline)
- Evaluation Plan (golden set, rubric/metrics, thresholds, failure taxonomy)
- Deployment/Rollout Plan (flags, canary/shadow, rollback triggers)
- Monitoring & Drift Plan (system, data, quality proxies, safety, cost)
- Iteration Loop Plan (what changes; retrain/update triggers)
- Model/Feature Card (intended use, limitations, risks)

## Agent Prompt
```md
You are executing **datasaa-ml-systemization**.

Produce: one-pager, baseline spec, eval plan, rollout plan, monitoring+drift plan, iteration loop plan, feature card.
Rules:
- Must define a baseline to beat.
- Must define evaluation before optimization (golden tasks + thresholds).
- Must include online quality proxies and cost budgets.
- Must include staged rollout and rollback triggers.
- Output artifacts in markdown using templates.
```

## Procedure
- Step 1: Choose minimum viable intelligence; document baseline and justification for ML/LLM.
- Step 2: Define end-to-end I/O contract including failure behavior.
- Step 3: Build evaluation stack: golden tasks + scoring + acceptance/regression thresholds.
- Step 4: Design production architecture: online/batch, sync/async, caching, isolation, versioning.
- Step 5: Plan safe rollout: feature flags, canary/shadow, rollback triggers.
- Step 6: Define monitoring: system health, data health, quality proxies, safety signals, cost budgets.
- Step 7: Define iteration loop: prompt/index/model updates + retrain triggers + A/B cadence.

## Templates
### One-Pager
```md
# ML/LLM System One-Pager — <feature>

## Goal
- User outcome:
- Business outcome:
- North-star + guardrails:

## Modality
- Baseline:
- Proposed approach:
- Justification:

## I/O contract
- Input schema:
- Output schema:
- Failure behavior:

## Evaluation
- Golden set:
- Metrics/rubric:
- Thresholds:

## Architecture
- Online/batch:
- Dependencies:
- Caching:
- Failure isolation:

## Rollout
- Flags/canary/shadow:
- Rollback triggers:

## Monitoring
- Health:
- Data drift:
- Quality proxies:
- Safety:
- Cost:

## Iteration loop
- What updates:
- Retrain/update triggers:
```

### Feature Card
```md
# Feature/Model Card — <feature>

## Intended use
- ...

## Not intended / non-goals
- ...

## Known limitations
- ...

## Failure modes
- ...

## Data + privacy
- Sources:
- Retention:
- Access:

## Monitoring + rollback
- Key signals:
- Rollback trigger:
```

## Quality Bar (pass/fail)
- Baseline defined and beatable.
- Golden tasks/scenario suite exists with thresholds.
- Rollout includes flags + rollback triggers.
- Monitoring includes cost + online quality proxies + safety signals.
- Iteration loop defined (what changes when and why).

## Common Failure Modes
- **Offline-only evaluation** → Add online proxies tied to user behavior and outcomes.
- **No cost budget for LLM** → Set token/tool-call budgets and add caching/degenerate modes.
- **No drift plan** → Monitor input distributions + quality proxies and define triggers.

## Skill Links
### Upstream
- datasaa-data-centric-design
- datasaa-tradeoff-reasoning

### Downstream
- datasaa-agent-orchestration
- datasaa-system-observability

## Sources (books)
- Designing ML Systems (Huyen)
- Building ML Powered Applications (Ameisen)
- Designing Data-Intensive Applications (Kleppmann)