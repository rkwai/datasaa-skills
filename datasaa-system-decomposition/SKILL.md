---
name: datasaa-system-decomposition
description: "Break a product slice into coherent components with clear responsibilities, contracts, data ownership, and failure behavior."
---

# datasaa-system-decomposition

## Purpose
Break a product slice into coherent components with clear responsibilities, contracts, data ownership, and failure behavior.

## When to use
- After discovery identifies a target slice to build.
- When multiple agents/teams need parallel work without collisions.
- When AI/agent systems require tool/memory/monitoring as first-class components.

## Inputs
### Required
- Target moment(s) that matter + desired behavior
- Constraints/guardrails (latency, cost, privacy, safety)
- Delivery modality (assist vs automation)

### Optional
- Existing architecture/module map
- Existing service contracts
- Infra/platform constraints

## Outputs (Definition of Done)
- Architecture Sketch (context/containers/components)
- Component Responsibility Map (SRP at component level)
- Interface Contracts (API/event/tool schemas + error semantics)
- Data Ownership + Flow Diagram (sources of truth + async/sync)
- Dependency Matrix (allowed/forbidden dependencies)

## Agent Prompt
```md
You are executing **datasaa-system-decomposition**.

Produce: architecture sketch, component responsibility cards, interface contracts, data flow, dependency matrix.
Rules:
- Decompose from user slice → responsibilities (not from tech stack).
- Each component must have a 1-sentence responsibility and explicit non-responsibilities.
- Define contracts before implementation (schemas + error semantics).
- Make failure behavior and data ownership explicit.
- Output artifacts in markdown using templates.
```

## Procedure
- Step 1: Start from the user slice and map responsibilities required to deliver it.
- Step 2: Find natural seams (domain, data, risk, latency, change-rate) and propose boundaries.
- Step 3: Create component cards with responsibility statements and non-functional requirements.
- Step 4: Define interface contracts (schemas, errors, retries/idempotency, versioning).
- Step 5: Assign single source-of-truth ownership for entities; map sync/async flows.
- Step 6: Document failure domains (timeouts, fallbacks, degradation) and dependency rules.
- Step 7: Validate with scenarios: happy path + tool failure + unsafe request + partial data.

## Templates
### Component Card
```md
# Component: <name>

## Responsibility (1 sentence)
- Exists to:
- Does NOT:

## Interfaces
- Inbound:
- Outbound:

## Data
- Owns (source of truth):
- Reads:
- Writes:
- Derived/cached:

## NFRs
- Latency/SLO:
- Availability:
- Cost budget:
- Privacy/security:

## Failure behavior
- Timeout/retry:
- Fallback/degrade:

## Observability
- Key metrics:
- Logs/traces:
```

### Contract Spec
```md
# Contract: <producer> -> <consumer>

Type: REST | gRPC | event | tool-call

## Input schema
- ...

## Output schema
- ...

## Errors
- Enumerate errors + meaning
- Retryable vs not
- Idempotency key behavior

## Versioning
- Backward compatibility rules
```

## Quality Bar (pass/fail)
- Components are named by responsibility, not technology.
- Each component has a clear SRP and explicit non-responsibilities.
- Contracts include schemas + error semantics + versioning.
- Data ownership has single writer per entity (or explicit conflict design).
- Failure behavior and safe degradation are defined.
- Dependencies are directional; cycles are avoided.

## Common Failure Modes
- **Layer-only decomposition (UI/API/DB) without responsibilities** → Recompose around the user slice and domain responsibilities.
- **Shared DB with unclear ownership** → Assign a single writer; expose access via contracts.
- **AI demo decomposition missing monitoring/feedback** → Add monitoring, feedback capture, and evaluation components.

## Skill Links
### Upstream
- datasaa-product-discovery

### Downstream
- datasaa-tradeoff-reasoning
- datasaa-data-centric-design

## Sources (books)
- Designing Data-Intensive Applications (Kleppmann)
- Clean Code (R. Martin)
- The Pragmatic Programmer (Hunt/Thomas)
- AI Agents in Action (Lanham)
- Designing ML Systems (Huyen)