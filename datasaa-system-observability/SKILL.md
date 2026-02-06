---
name: datasaa-system-observability
description: "Make systems measurable and debuggable in production: SLIs/SLOs, logs, traces, dashboards, alerts, runbooks, and AI/agent telemetry."
---

# datasaa-system-observability

## Purpose
Make systems measurable and debuggable in production: SLIs/SLOs, logs, traces, dashboards, alerts, runbooks, and AI/agent telemetry.

## When to use
- Before shipping new slices to production.
- When quality, safety, or cost can drift (AI/agents).
- When ops/debug time is high or incidents are hard to diagnose.

## Inputs
### Required
- Success metrics + guardrails
- System decomposition + contracts
- Privacy/PII constraints

### Optional
- Existing telemetry stack and naming conventions
- Oncall policies
- Known failure modes/incidents

## Outputs (Definition of Done)
- Observability Spec (SLIs/SLOs, dashboards, alerts, owners)
- Structured Log Schema + redaction rules
- Trace Context Standard (correlation IDs end-to-end)
- Dashboards (product, system health, AI quality+cost, safety+trust)
- Alert Policy + Runbooks
- AI/Agent Telemetry Spec (versions, tool calls, costs, outcomes)
- Post-incident Learning Template

## Agent Prompt
```md
You are executing **datasaa-system-observability**.

Produce an observability spec with SLOs, structured logs, traces, dashboards, alerts+runbooks, and AI/agent telemetry.
Rules:
- Tie SLOs to guardrails (latency/cost/safety).
- Standardize correlation IDs across services and tool calls.
- Include online quality proxies and cost budgets for AI.
- Define what happens when alerts fire (runbook).
- Respect privacy: redact/minimize sensitive payloads.
```

## Procedure
- Step 1: Define SLIs/SLOs for reliability, cost, quality, safety, and data health.
- Step 2: Specify golden signals per component (latency/errors/throughput/saturation/dependencies).
- Step 3: Define structured log schema + redaction; require request/trace IDs.
- Step 4: Define tracing standards across boundaries (including tools) and span naming.
- Step 5: Define AI/agent quality proxies (accept/edit/undo/escalation) and cost metrics.
- Step 6: Create 4 golden dashboards: product, system health, AI quality+cost, safety+trust.
- Step 7: Define alerts: page only on SLO breaches; add runbooks and owners.
- Step 8: Define post-incident learning loop template.

## Templates
### Observability Spec
```md
# Observability Spec — <system/feature>

## SLIs/SLOs (guardrails)
- Availability:
- p95 latency:
- Error rate:
- Cost budget:
- Quality proxy:
- Safety metrics:
- Data health:

## Instrumentation
- Metrics:
- Logs (schema + redaction):
- Traces (propagation + spans):

## Dashboards
- Product:
- System:
- AI/Agent:
- Safety:

## Alerts + runbooks
- Paging:
- Ticket:
- Owners:
```

### Post-Incident
```md
# Post-Incident / Learning Note

## What happened
- ...

## Impact
- Users affected:
- Guardrails breached:

## Root cause
- ...

## Mitigation
- ...

## Prevent recurrence
- Tests added:
- Monitors added:
- Runbook updates:
```

## Quality Bar (pass/fail)
- SLOs exist and map to guardrails.
- Logs are structured, consistent, and privacy-safe.
- Traces connect end-to-end including tool calls.
- Dashboards cover product outcomes + AI quality/cost + safety.
- Alerts have owners and runbooks; paging is limited to real emergencies.
- Post-incident loop turns signals into backlog items.

## Common Failure Modes
- **Pretty dashboards nobody uses** → Keep 4 golden dashboards and remove noise.
- **Alert fatigue** → Page on SLO breaches; route trends to tickets.
- **AI quality silently degrades** → Add online proxies + drift monitors + rollback triggers.

## Skill Links
### Upstream
- datasaa-data-centric-design
- datasaa-ml-systemization
- datasaa-agent-orchestration

### Downstream
- datasaa-iterative-delivery

## Sources (books)
- Designing Data-Intensive Applications (Kleppmann)
- Designing ML Systems (Huyen)
- AI Agents in Action (Lanham)