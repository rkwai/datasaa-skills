---
name: datasaa-agent-orchestration
description: "Design and operate reliable multi-step agents: tool contracts, control loops, memory policy, guardrails, traces, and eval harnesses."
---

# datasaa-agent-orchestration

## Purpose
Design and operate reliable multi-step agents: tool contracts, control loops, memory policy, guardrails, traces, and eval harnesses.

## When to use
- Building coding agents, workflow agents, or multi-agent systems.
- Whenever LLMs can call tools or take actions.
- When you need predictable behavior under budgets and safety constraints.

## Inputs
### Required
- Agent goal as artifacts + success metrics
- Tooling surface and allowed permissions
- Budgets (steps/tool calls/tokens/time/$) + safety constraints

### Optional
- Existing tool schemas
- Golden tasks list
- Existing telemetry stack

## Outputs (Definition of Done)
- Agent Contract (goal, non-goals, stop/escalate conditions)
- Tool Contract Pack (schemas, validation, errors, idempotency, budgets)
- Orchestration Plan (state machine + transitions + replanning triggers)
- Memory Policy (store/retrieve/retention/privacy)
- Safety & Permissions Policy (allowlist, checkpoints, kill switch, degradation)
- Execution Trace Spec (structured logs/traces)
- Evaluation Harness (golden tasks + scenario tests + thresholds)

## Agent Prompt
```md
You are executing **datasaa-agent-orchestration**.

Design the agent as a production system. Produce: agent contract, tool contracts, orchestration plan, memory policy, safety/permissions, trace spec, eval harness.
Rules:
- Default to conservative permissions (read-only + propose changes).
- Tool calls must be schema-validated; deny-by-default.
- Use a plan→act→observe→update control loop with replanning triggers.
- Include budgets + no-progress detection + safe degradation modes.
- Output artifacts in markdown using templates.
```

## Procedure
- Step 1: Define agent contract: artifacts, non-goals, success metrics, stop/escalate rules.
- Step 2: Define tool contracts: strict schemas, validation, error semantics, idempotency, budgets, safety constraints.
- Step 3: Design orchestration as a state machine; define transitions, replanning triggers, and 'no progress' detector.
- Step 4: Define memory policy: working vs long-term; retrieval/write triggers; retention; privacy.
- Step 5: Define guardrails: permission gates, human checkpoints for high-impact actions, kill switch, safe defaults.
- Step 6: Define observability: step traces with intent, tool inputs/outputs, validations, artifact refs, cost counters.
- Step 7: Define evaluation harness: golden tasks + adverse scenarios + regression thresholds.

## Templates
### Agent Contract
```md
# Agent Contract — <agent_name>

## Goal (artifacts)
- Produce:
- Done when:

## Non-goals
- Must not:

## Allowed actions
- Read:
- Write: (approval required? Y/N)
- External calls:

## Guardrails
- Budgets:
- Safety constraints:

## Stop + escalate
- Stop if:
- Escalate if:
```

### Tool Contract
```md
# Tool Contract — <tool_name>

Purpose:
Input schema:
Output schema:
Validation rules:
Errors (retryable?):
Idempotency:
Rate/cost limits:
Safety constraints:
```

## Quality Bar (pass/fail)
- Strict tool schemas + validation; deny-by-default.
- Budgets defined + no-progress detection.
- Human checkpoints for risky actions; kill switch exists.
- Memory policy defined with retention and privacy rules.
- Structured traces make behavior debuggable.
- Evaluation harness exists with thresholds.

## Common Failure Modes
- **Hallucinated / malformed tool calls** → Enforce schema validation + tool adapters that reject invalid calls.
- **Runaway loops / cost explosions** → Add budgets + no-progress detector + degrade mode + caching.
- **Unsafe autonomy** → Permission gates + approval states + sandboxed tools + narrow scopes.

## Skill Links
### Upstream
- datasaa-ml-systemization
- datasaa-system-decomposition

### Downstream
- datasaa-human-in-the-loop-design
- datasaa-system-observability

## Sources (books)
- AI Agents in Action (Lanham)
- Designing ML Systems (Huyen)
- Designing Data-Intensive Applications (Kleppmann)