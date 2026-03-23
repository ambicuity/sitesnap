#!/usr/bin/env bash
set -euo pipefail

repo="${GITHUB_REPOSITORY:?GITHUB_REPOSITORY is required}"
output="CONTRIBUTORS.md"

tmp_json="$(mktemp)"
gh api "/repos/${repo}/contributors?per_page=100" --paginate > "${tmp_json}"

{
  echo "# Contributors Hall of Fame"
  echo
  echo "This file is generated automatically by the `Update Contributors Hall of Fame` workflow."
  echo
  echo "## Contributors"
  echo
  jq -r '
    map(select(.type == "User" and (.login | test("\\[bot\\]$") | not))) as $users |
    if ($users | length) == 0 then
      "_No contributors recorded yet._"
    else
      $users
      | sort_by(.login)
      | .[]
      | "- [\(.login)](\(.html_url)) - \(.contributions) contribution(s)"
    end
  ' "${tmp_json}"
} > "${output}"

rm -f "${tmp_json}"
