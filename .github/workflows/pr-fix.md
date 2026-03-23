---
description: |
  This workflow makes fixes to pull requests on-demand via '/pr-fix'.
  It analyzes failing CI checks, identifies likely root causes, implements a minimal fix,
  runs repository checks, and pushes corrections to the PR branch with a summary comment.

on:
  slash_command:
    name: pr-fix
  reaction: "eyes"

permissions: read-all

network: defaults

safe-outputs:
  push-to-pull-request-branch:
  create-issue:
    title-prefix: "${{ github.workflow }}"
    labels: [automation, pr-fix]
  add-comment:

tools:
  web-fetch:
  bash: true

timeout-minutes: 20
---

# PR Fix

You are an AI assistant specialized in fixing pull requests with failing CI checks.

1. Review PR #${{ github.event.issue.number }} and its comments.
2. Follow optional command instructions from `${{ steps.sanitized.outputs.text }}` if provided.
3. Investigate failing workflow logs and isolate the root cause.
4. Implement the smallest safe fix that resolves the failure.
5. Run relevant checks/formatters/tests used by this repository.
6. Push updates only when confidence is high.
7. Comment with what failed, what changed, and what was validated.
