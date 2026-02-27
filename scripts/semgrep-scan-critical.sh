#!/usr/bin/env bash
set -euo pipefail

JAVA_RULES_DIR=${1:-rules/official-java-semgrep/java}
CUSTOM_RULES_DIR=${2:-rules/custom}
SRC_DIR=${3:-src}

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/semgrep-common.sh"

info "Сканирование только критичных уязвимостей..."

semgrep --config "${JAVA_RULES_DIR}/" \
        --config "${CUSTOM_RULES_DIR}/" \
        --severity ERROR \
        "${SRC_DIR}"
