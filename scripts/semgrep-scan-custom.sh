#!/usr/bin/env bash
set -euo pipefail

CUSTOM_RULES_DIR=${1:-rules/custom}
SRC_DIR=${2:-src}

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/semgrep-common.sh"

_cmd_banner

info "Scanning with custom rules..."
semgrep --config "${CUSTOM_RULES_DIR}/" "${SRC_DIR}"