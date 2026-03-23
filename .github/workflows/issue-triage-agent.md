---
timeout-minutes: 5
strict: true
on:
  issues:
    types: [opened, reopened]
  schedule: "0 14 * * 1-5"
  workflow_dispatch:
permissions:
  issues: read
tools:
  github:
    lockdown: false
    toolsets: [issues, labels]
safe-outputs:
  add-labels:
    allowed: ["bug", "enhancement", "documentation", "security", "needs-triage", "good first issue candidate", "help wanted", "plan-me"]
  add-comment: {}
---

# Issue Triage Agent - SiteSnap

Triage unlabeled issues in `${{ github.repository }}`.

## Rules

- Skip issues that already have labels.
- Skip issues assigned to someone.
- Apply one primary label: `bug`, `enhancement`, `documentation`, or `security`.
- Add secondary labels when relevant: `needs-triage`, `good first issue candidate`, `help wanted`, `plan-me`.

## Comment style

After labeling, post a short comment explaining:

- What label was applied
- Why it was chosen
- Next action for contributors

Be concise, neutral, and helpful.
