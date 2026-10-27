# Context agent

**Owns:** the outer loop. It finds out from the real world what is worth building and keeps that picture current.

The people who talk to customers still own the conversation. This agent makes sure what they learned doesn't die in a meeting note. It turns chat, meetings and email into a context record that other agents can trust.

## Reads
- Meeting transcripts, client chat, email threads, support issues
- The current context record and the open work (tickets, epics, plans)

## Writes
- The context record for each client or product (`context/<name>.md`)
- A context diff each time new material lands: what changed, and what it means for work in motion

## Skills
| Skill | What it produces |
|---|---|
| [`datasaa-context-intake`](skills/datasaa-context-intake/SKILL.md) | New material sorted into the context record, with its source |
| [`datasaa-client-brief`](skills/datasaa-client-brief/SKILL.md) | A brief that keeps the client's words apart from our assumptions |
| [`datasaa-context-diff`](skills/datasaa-context-diff/SKILL.md) | What changed vs. work in motion, as proposed work items |

## Guardrails
| Does alone | Needs a human yes |
|---|---|
| Read sources it was granted, update the context record, propose work items | Mark a claim *validated* unless the client said it |
| Flag conflicts between new context and work in motion | Contact a client or anyone outside the company |
| Ask other agents for status | Drop or reprioritize committed work |

## Hands off to
- **Harness agent:** proposed work items with the context that justifies them
- **Client focus agent:** anything that changes a client's asks or dates
- **Chief of staff:** sources it can't reach, and context it thinks is going stale
