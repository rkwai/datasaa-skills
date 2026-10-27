## Loop: weekly finance export
**Outcome:** Finance gets Monday's export and doesn't rebuild it by hand. Totals tie to the jobs system, canceled jobs included.

**Gather:** the client brief (sections 1–2 only as facts), last Monday's hand-built file once we get it, the jobs table schema.

**Steps**
1. Generate the export (all job statuses) as CSV behind a format switch.
2. Run the checks below.
3. If they pass, open a PR with the export and the check report.

**Validate against**
- Row count equals the jobs-table count for the week, all statuses.
- Canceled jobs are present and flagged.
- Column totals match the jobs-table totals to the cent.
- Once the sample arrives: column names match finance's hand-built file.

**Verify by:** finance opens the file for one real Monday and confirms it ties. The client focus agent asks; a person approves the ask.

**On failure:** retry up to 2 times with the failing check in the prompt. Then stop and post the failing check to status. No silent fixes.

**Human gates:** merge (engineer) · first send to the client (accountable human) · format lock-in (after Priya answers)

**Record to:** `loops/finance-export.log.md`: each run's checks, failures and fixes.
