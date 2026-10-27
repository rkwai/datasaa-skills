---
name: datasaa-human-in-the-loop-design
description: "Design deployable autonomy: approvals, escalation, review UX, undo/rollback, auditability, and feedback that improves the system."
---

# datasaa-human-in-the-loop-design

## Purpose
Design deployable autonomy: approvals, escalation, review UX, undo/rollback, auditability, and feedback that improves the system.

## When to use
- Any agent/AI can take actions or generate consequential outputs.
- Before increasing autonomy levels.
- When trust/adoption is a gating factor.

## Inputs
### Required
- Actions the agent can take + permissions policy
- Risk constraints (safety/privacy/legal/money/irreversible actions)
- Who the reviewer is (end-user vs ops vs engineer)

### Optional
- Existing approval workflows
- Incident history and known hazards
- Compliance/audit requirements

## Outputs (Definition of Done)
- Autonomy Ladder + promotion criteria
- Approval & Escalation Policy (hard/soft triggers)
- Review UX Spec (diffs, evidence, confidence, undo)
- Override/Undo & Rollback Design
- Accountability & Audit Spec (who/what/when/version)
- Feedback Taxonomy (structured reject/edit/escalate reasons)
- HITL Scenario Test Suite (pass/fail thresholds)

## Agent Prompt
```md
You are executing **datasaa-human-in-the-loop-design**.

Produce: autonomy ladder, approval/escalation policy, review UX spec, undo/rollback design, audit spec, feedback taxonomy, HITL test suite.
Rules:
- High impact OR high uncertainty actions require checkpoints (at least initially).
- Reviews must be fast: show diffs, evidence, and rollback plan.
- Define promotion criteria based on metrics, not feelings.
- Feedback must be structured to feed iteration loops.
- Output artifacts in markdown using templates.
```

## Procedure
- Step 1: Classify actions by impact × uncertainty; define default checkpoints.
- Step 2: Define autonomy ladder (observe → suggest → draft → execute-with-approval → guarded autonomy).
- Step 3: Design approval cards (what/why/risk/blast radius/cost/rollback).
- Step 4: Design review UX: diffs, evidence links, uncertainty, constraints checks, undo.
- Step 5: Define escalation triggers (hard vs soft) and who receives escalations.
- Step 6: Define rollback/undo paths for every autonomous action type.
- Step 7: Define audit logs and feedback taxonomy; build HITL scenario tests.

## Templates
### Approval Request
```md
# Approval Request — <action>

What will happen:
- ...

Why:
- Goal alignment:
- Expected outcome:

Evidence:
- Links/artifacts/tests:

Risk & blast radius:
- Worst-case:
- Affected systems/users:

Cost/time:
- Est. tool calls/tokens/time:

Rollback plan:
- ...

Decision: Approve | Reject | Request changes
```

### Autonomy Ladder
```md
# Autonomy Ladder — <system>

Level | Name | Allowed actions | Requires approval | Promotion criteria
---|---|---|---|---
0 | Observe-only | ... | N/A | ...
1 | Suggest | ... | ... | ...
2 | Draft | ... | ... | ...
3 | Execute w/ approval | ... | Y | ...
4 | Guarded autonomy | ... | exceptions | ...
```

## Quality Bar (pass/fail)
- Autonomy ladder exists with promotion criteria.
- High-risk actions cannot execute without checkpoint.
- Review UX shows diffs/evidence/rollback.
- Undo/rollback exists for autonomous actions.
- Audit spec ties actions to identities and versions.
- Feedback taxonomy is structured; HITL scenarios exist.

## Common Failure Modes
- **Rubber-stamp approvals** → Improve evidence/diffs and reduce noise; require clear rollback plan.
- **Too much friction (HITL bottleneck)** → Batch approvals, narrow autonomy for low-risk actions, better summarization.
- **No accountability** → Enforce audit logs + version pinning + identity binding.

## Skill Links
### Upstream
- datasaa-agent-orchestration
- datasaa-user-value-modeling

### Downstream
- datasaa-iterative-delivery
- datasaa-system-observability

## Sources (books)
- The Art of AI Product Development (Lipenkova)
- AI Agents in Action (Lanham)
- INSPIRED (Cagan)