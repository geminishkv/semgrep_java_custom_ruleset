#!/usr/bin/env bash
set -euo pipefail

REPORT_DIR=${1:-reports}
JAVA_RULES_DIR=${2:-rules/official-java-semgrep/java}
CUSTOM_RULES_DIR=${3:-rules/custom}

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/semgrep-common.sh"

info "Глубокая очистка (dist-clean)..."

if [ -d "${REPORT_DIR}" ]; then
  warn "Удаляю отчёты: ${REPORT_DIR}"
  rm -rf "${REPORT_DIR}"
fi

if [ -d ".semgrep-cache" ]; then
  warn "Удаляю .semgrep-cache"
  rm -rf ".semgrep-cache"
fi

info "Готово."
