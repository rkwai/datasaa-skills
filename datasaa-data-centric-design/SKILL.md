---
name: datasaa-data-centric-design
description: "Define data domains, ownership, quality, lineage, feedback capture, and governance so AI/product systems remain correct and improvable."
---

# datasaa-data-centric-design

## Purpose
Define data domains, ownership, quality, lineage, feedback capture, and governance so AI/product systems remain correct and improvable.

## When to use
- Any feature relies on data correctness, analytics, ML/LLMs, or memory.
- Before building pipelines, retrieval indexes, or agent memory.
- When schema evolution and governance matter (always, usually).

## Inputs
### Required
- System decomposition + contracts
- Success metrics + what must be measured
- Privacy/compliance constraints

### Optional
- Existing schemas and data sources
- Data platform tooling (warehouse, streams, feature store)
- Retention/audit requirements

## Outputs (Definition of Done)
- Data Domain Map (entities/events + sources of truth)
- Canonical Schemas + semantics + versioning policy
- Data Contracts (producer/consumer SLAs, errors, backfills)
- Data Quality Spec (checks + SLIs + degradation behavior)
- Lineage/Flow Diagram
- Feedback Capture Plan (accept/edit/undo/escalation signals)
- Governance Constraints (PII classes, retention, access, audit)

## Agent Prompt
```md
You are executing **datasaa-data-centric-design**.

Produce: data domain map, schemas, data contracts, data quality spec, lineage/flow diagram, feedback capture, governance constraints.
Rules:
- Assign a single source of truth per entity and a single writer unless explicitly designed otherwise.
- Document schema semantics (meaning), not just types.
- Define quality checks and what the system does when checks fail (degrade safely).
- Include feedback signals for AI/agent outputs and privacy/retention rules.
- Output artifacts in markdown using templates.
```

## Procedure
- Step 1: Identify entities and events; assign ownership and sources of truth.
- Step 2: Define canonical schemas with semantics, IDs, timestamps, PII classification, versioning rules.
- Step 3: Write data contracts between producers and consumers (freshness/completeness SLAs, retries, DLQ/quarantine).
- Step 4: Define data quality SLIs and checks (validity, completeness, timeliness, uniqueness, consistency).
- Step 5: Draw lineage and flow (ingest → transform → serve → monitor).
- Step 6: Design feedback capture for product and AI systems (accept/edit/undo/escalate).
- Step 7: Define governance: access controls, retention, audit logs, right-to-delete if applicable.

## Templates
### Data Contract
```md
# Data Contract: <Producer> -> <Consumer>

## Purpose
- Supports decision/feature:

## Schema
- Version:
- Entity/Event:
- Fields + semantics:

## Delivery semantics
- Transport:
- Freshness SLA:
- Completeness:
- Idempotency key:

## Error handling
- Retry policy:
- Quarantine/DLQ:
- Consumer fallback:

## Governance
- PII fields:
- Retention:
- Access/audit:
```

### Data Quality
```md
# Data Quality Spec — <Dataset/Stream>

## SLIs
- Freshness:
- Completeness:
- Validity:
- Uniqueness:
- Consistency:

## Checks
- Ingestion:
- Transform:
- Serving:

## Degradation behavior
- Feature fallbacks:
- Alerts/oncall:
```

## Quality Bar (pass/fail)
- Single source of truth and writer per entity (or explicit conflict strategy).
- Schemas include semantics, IDs, and timestamp meaning.
- Contracts include SLAs + versioning + backfill policy.
- Quality checks exist with explicit degradation behavior.
- Feedback signals are captured for AI/agent outputs.
- Governance (PII/retention/access/audit) is defined.

## Common Failure Modes
- **Data ownership ambiguity** → Assign single writer and expose via contracts.
- **Quality is a dashboard, not a gate** → Add checks that block/quarantine and degrade features safely.
- **Agent memory becomes a junk drawer** → Define schemas, retention, and retrieval triggers; store only justified facts.

## Skill Links
### Upstream
- datasaa-system-decomposition
- datasaa-tradeoff-reasoning

### Downstream
- datasaa-ml-systemization
- datasaa-system-observability

## Sources (books)
- Designing Data-Intensive Applications (Kleppmann)
- Designing ML Systems (Huyen)
- Building ML Powered Applications (Ameisen)
- AI Agents in Action (Lanham)