#!/usr/bin/env bash
set -euo pipefail

JAVA_RULES_DIR=${1:-rules/official-java-semgrep/java}
CUSTOM_RULES_DIR=${2:-rules/custom}
SRC_DIR=${3:-src}

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/semgrep-common.sh"

_cmd_banner

info "📄 Rules Statistics"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Official Java rules: $(find "${JAVA_RULES_DIR}" -name '*.yml' -o -name '*.yaml' 2>/dev/null | wc -l | tr -d ' ')"

if [ -d "${CUSTOM_RULES_DIR}" ]; then
  echo "Custom rules: $(find "${CUSTOM_RULES_DIR}" -name '*.yml' -o -name '*.yaml' 2>/dev/null | wc -l | tr -d ' ')"
else
  echo "Custom rules: 0"
fi

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Paths:"
echo "  Java rules:   ${JAVA_RULES_DIR}"
echo "  Custom rules: ${CUSTOM_RULES_DIR}"
echo "  Source code:  ${SRC_DIR}"