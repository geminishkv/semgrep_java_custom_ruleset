#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/semgrep-common.sh"

_cmd_banner

info "📄 Submodule Status"
git submodule status rules/official-java-semgrep || true

echo ""
echo "Current commit:"
if [ -d "rules/official-java-semgrep" ]; then
  cd rules/official-java-semgrep
  git log -1 --oneline || true
fi