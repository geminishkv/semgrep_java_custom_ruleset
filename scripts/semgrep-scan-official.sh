#!/usr/bin/env bash
set -euo pipefail

JAVA_RULES_DIR=${1:-rules/official-java-semgrep/java}
SRC_DIR=${2:-src}

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/semgrep-common.sh"

_cmd_banner

info "Scanning with official Java rules..."
semgrep --config "${JAVA_RULES_DIR}/" "${SRC_DIR}"