#!/usr/bin/env bash
set -euo pipefail

CUSTOM_RULES_DIR=${1:-rules/custom}

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/semgrep-common.sh"

_cmd_banner

info "✓ Validating custom rules..."

if [ -d "${CUSTOM_RULES_DIR}" ]; then
  semgrep --validate --config "${CUSTOM_RULES_DIR}/"
else
  warn "⚠️ No custom rules directory found"
fi