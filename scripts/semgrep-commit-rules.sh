#!/usr/bin/env bash
set -euo pipefail

JAVA_RULES_DIR=${1:-rules/official-java-semgrep/java}
CUSTOM_RULES_DIR=${2:-rules/custom}
SRC_DIR=${3:-src}
REPORT_DIR=${4:-reports}

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/semgrep-common.sh"

if ! git diff-index --quiet HEAD rules/official-java-semgrep 2>/dev/null; then
  git commit -m "chore: update Semgrep Java rules from official repository"
  info "✅ Изменения закоммичены"
else
  warn "⚠️ Нет изменений для коммита"
fi
