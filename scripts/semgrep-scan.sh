#!/usr/bin/env bash
set -euo pipefail

JAVA_RULES_DIR=${1:-rules/official-java-semgrep/java}
CUSTOM_RULES_DIR=${2:-rules/custom}
SRC_DIR=${3:-src}
REPORT_DIR=${4:-reports}

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/semgrep-common.sh"

_cmd_banner

info "Scanning with all rules..."
mkdir -p "${REPORT_DIR}"

semgrep --config "${JAVA_RULES_DIR}/" \
        --config "${CUSTOM_RULES_DIR}/" \
        --json -o "${REPORT_DIR}/semgrep-full.json" \
        --verbose \
        "${SRC_DIR}"

info "✅ Report saved: ${REPORT_DIR}/semgrep-full.json"