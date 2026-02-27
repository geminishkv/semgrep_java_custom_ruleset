#!/usr/bin/env bash
set -euo pipefail

JAVA_RULES_DIR=${1:-rules/official-java-semgrep/java}
CUSTOM_RULES_DIR=${2:-rules/custom}
SRC_DIR=${3:-src}
REPORT_DIR=${4:-reports}

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/semgrep-common.sh"

info "Инициализация подмодуля с Java‑правилами..."
git submodule update --init

warn "⚠️ Настройка sparse checkout только для java..."
cd rules/official-java-semgrep
git sparse-checkout init --cone
git sparse-checkout set java
git sparse-checkout reapply
git reset --hard HEAD
cd ../..

info "✅ Java‑правила инициализированы"
ls -la rules/official-java-semgrep/
