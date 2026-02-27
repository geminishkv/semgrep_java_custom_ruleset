#!/usr/bin/env bash
set -euo pipefail

JAVA_RULES_DIR=${1:-rules/official-java-semgrep/java}
CUSTOM_RULES_DIR=${2:-rules/custom}
SRC_DIR=${3:-src}
REPORT_DIR=${4:-reports}

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/semgrep-common.sh"

_cmd_banner

info "Updating Java rules from upstream..."
cd rules/official-java-semgrep
git fetch origin
git checkout main
git pull origin main
git sparse-checkout set java
cd ../..

warn "⚠️ Staging changes..."
git add rules/official-java-semgrep

if ! git diff-index --quiet HEAD rules/official-java-semgrep 2>/dev/null; then
  info "✅ Java rules updated"
  warn "⚠️ Run 'git commit -m \"chore: update Java rules\"' to commit"
else
  info "✅ Java rules already up to date"
fi