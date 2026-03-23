#!/usr/bin/env bash
set -euo pipefail

REPO="ambicuity/sitesnap"

echo "Creating labels for ${REPO}"

create_label() {
  local name="$1"
  local color="$2"
  local description="$3"
  gh label create "$name" --repo "$REPO" --color "$color" --description "$description" --force >/dev/null
  echo "  - $name"
}

create_label "bug" "d73a4a" "Something is broken"
create_label "enhancement" "a2eeef" "Improvement request"
create_label "documentation" "0075ca" "Documentation updates"
create_label "security" "ee0701" "Security/privacy concern"
create_label "chore" "fef2c0" "Maintenance task"

create_label "needs-triage" "ededed" "Awaiting maintainer triage"
create_label "status: in-progress" "fbca04" "Actively in progress"
create_label "blocked" "b60205" "Blocked by dependency or decision"
create_label "help wanted" "008672" "Community help wanted"
create_label "good first issue" "7057ff" "Good starter issue"
create_label "good first issue candidate" "e4e669" "Potential starter issue"
create_label "plan-me" "1d76db" "Needs an implementation plan"

create_label "priority: critical" "b60205" "Immediate attention required"
create_label "priority: high" "e11d48" "High priority"
create_label "priority: medium" "f59e0b" "Medium priority"
create_label "priority: low" "94a3b8" "Low priority"

create_label "automation" "0e8a16" "Automation-generated work"
create_label "testing" "5319e7" "Testing-focused work"
create_label "pr-fix" "bfdadc" "PR fix automation"
create_label "backlog-burn" "c2e0c6" "Backlog burner automation"

echo "Done."
