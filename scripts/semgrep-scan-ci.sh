#!/usr/bin/env bash
set -euo pipefail

JAVA_RULES_DIR=${1:-rules/official-java-semgrep/java}
CUSTOM_RULES_DIR=${2:-rules/custom}
SRC_DIR=${3:-src}
REPORT_DIR=${4:-reports}

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/semgrep-common.sh"

info "Запуск CI‑сканирования..."
mkdir -p "${REPORT_DIR}"

semgrep --config "${JAVA_RULES_DIR}/" \
        --config "${CUSTOM_RULES_DIR}/" \
        --json -o "${REPORT_DIR}/semgrep.json" \
        "${SRC_DIR}"

warn "Генерация SARIF..."
semgrep --config "${JAVA_RULES_DIR}/" \
        --config "${CUSTOM_RULES_DIR}/" \
        --sarif -o "${REPORT_DIR}/semgrep.sarif" \
        "${SRC_DIR}"

info "✅ Отчёты созданы: ${REPORT_DIR}/semgrep.json, ${REPORT_DIR}/semgrep.sarif"
