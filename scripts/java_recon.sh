#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/semgrep-common.sh"
source "${SCRIPT_DIR}/semgrep-banner.sh"

JAVA_RULES_DIR=${JAVA_RULES_DIR:-rules/official-java-semgrep/java}
CUSTOM_RULES_DIR=${CUSTOM_RULES_DIR:-rules/custom}
SRC_DIR=${SRC_DIR:-src}
REPORT_DIR=${REPORT_DIR:-reports}

cmd=${1:-help}
shift || true

_cmd_banner

case "${cmd}" in
  init)
    "${SCRIPT_DIR}/semgrep-init.sh" \
      "${JAVA_RULES_DIR}" "${CUSTOM_RULES_DIR}" "${SRC_DIR}" "${REPORT_DIR}"
    ;;
  update-rules)
    "${SCRIPT_DIR}/semgrep-update-rules.sh" \
      "${JAVA_RULES_DIR}" "${CUSTOM_RULES_DIR}" "${SRC_DIR}" "${REPORT_DIR}"
    ;;
  commit-rules)
    "${SCRIPT_DIR}/semgrep-commit-rules.sh" \
      "${JAVA_RULES_DIR}" "${CUSTOM_RULES_DIR}" "${SRC_DIR}" "${REPORT_DIR}"
    ;;
  scan)
    "${SCRIPT_DIR}/semgrep-scan.sh" \
      "${JAVA_RULES_DIR}" "${CUSTOM_RULES_DIR}" "${SRC_DIR}" "${REPORT_DIR}"
    ;;
  scan-official)
    "${SCRIPT_DIR}/semgrep-scan-official.sh" \
      "${JAVA_RULES_DIR}" "${SRC_DIR}"
    ;;
  scan-custom)
    "${SCRIPT_DIR}/semgrep-scan-custom.sh" \
      "${CUSTOM_RULES_DIR}" "${SRC_DIR}"
    ;;
  scan-critical)
    "${SCRIPT_DIR}/semgrep-scan-critical.sh" \
      "${JAVA_RULES_DIR}" "${CUSTOM_RULES_DIR}" "${SRC_DIR}"
    ;;
  scan-ci)
    "${SCRIPT_DIR}/semgrep-scan-ci.sh" \
      "${JAVA_RULES_DIR}" "${CUSTOM_RULES_DIR}" "${SRC_DIR}" "${REPORT_DIR}"
    ;;
  validate)
    "${SCRIPT_DIR}/semgrep-validate.sh" \
      "${CUSTOM_RULES_DIR}"
    ;;
  stats)
    "${SCRIPT_DIR}/semgrep-stats.sh" \
      "${JAVA_RULES_DIR}" "${CUSTOM_RULES_DIR}" "${SRC_DIR}"
    ;;
  status)
    "${SCRIPT_DIR}/semgrep-status.sh"
    ;;
  clean)
    "${SCRIPT_DIR}/semgrep-clean.sh" \
      "${REPORT_DIR}"
    ;;
  dist-clean)
    "${SCRIPT_DIR}/semgrep-dist-clean.sh" \
      "${REPORT_DIR}" "${JAVA_RULES_DIR}" "${CUSTOM_RULES_DIR}"
    ;;
  dedupe)
    "${SCRIPT_DIR}/semgrep-dedupe.sh"
    ;;
  help|--help|-h|"")
    "${SCRIPT_DIR}/semgrep-help.sh" \
      "${JAVA_RULES_DIR}" "${CUSTOM_RULES_DIR}" "${SRC_DIR}" "${REPORT_DIR}"
    ;;
  *)
    warn "Неизвестная команда: ${cmd}"
    "${SCRIPT_DIR}/semgrep-help.sh" \
      "${JAVA_RULES_DIR}" "${CUSTOM_RULES_DIR}" "${SRC_DIR}" "${REPORT_DIR}"
    exit 1
    ;;
esac
