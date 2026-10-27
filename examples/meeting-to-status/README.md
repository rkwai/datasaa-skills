# Worked example: one client meeting, all the way to a status file

**Everything here is made up.** The company, people and numbers are fictional and exist only to show how artifacts move between agents. The shape of the flow is the real one.

The setup: a fictional regional home-services company, "Northwind Home", wants its customer data exported every week for its finance team.

| Step | Agent | Skill | Artifact |
|---|---|---|---|
| 0 | (people) | — | [`00-transcript.md`](00-transcript.md): what the client actually said |
| 1 | Context | `datasaa-context-intake` | [`01-intake.md`](01-intake.md) |
| 2 | Context | `datasaa-client-brief` | [`02-brief.md`](02-brief.md) |
| 3 | Context | `datasaa-context-diff` | [`03-diff.md`](03-diff.md) |
| 4 | Harness | `datasaa-loop-design` | [`04-loop.md`](04-loop.md) |
| 5 | Harness → Client focus | `datasaa-status-from-records`, `datasaa-delivery-update` | [`05-status.md`](05-status.md) |

What to notice:
- Nothing is called validated unless the client said it (step 2).
- The diff changes a committed date, so a person decides. The agent only proposes (step 3).
- The loop validates its own output before anyone reviews it, and it stops at the gates (step 4).
- The status is generated from the records, and every item has an owner (step 5).
