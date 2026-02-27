#!/usr/bin/env bash
set -euo pipefail

REPORT_DIR=${1:-reports}

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/semgrep-common.sh"

info "Очистка отчётов..."
rm -rf "${REPORT_DIR}"
info "✅ Отчёты удалены"
