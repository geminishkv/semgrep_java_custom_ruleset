#!/usr/bin/env bash
set -euo pipefail

# Всегда работаем относительно исходников, не установленной копии
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CUSTOM_RULES_DIR="${ROOT_DIR}/rules/custom"

if ! command -v yq >/dev/null 2>&1; then
  echo "yq не найден. Установи mikefarah/yq (https://github.com/mikefarah/yq)." >&2
  exit 1
fi

if [ ! -d "${CUSTOM_RULES_DIR}" ]; then
  echo "Каталог с кастомными правилами не найден: ${CUSTOM_RULES_DIR}" >&2
  exit 1
fi

tmp_patterns="$(mktemp)"
trap 'rm -f "${tmp_patterns}"' EXIT

extract_patterns() {
  local file="$1"
  yq -r '
    (.rules // [])[]? as $rule
    | [
        ($rule.pattern // empty),
        ($rule."pattern-regex" // empty),
        ($rule.patterns[]?.pattern // empty),
        ($rule."pattern-either"[]?.pattern // empty)
      ]
    | .[]
    | select(. != null and . != "")
  ' "${file}" 2>/dev/null \
  | sed 's/^[[:space:]]*//; s/[[:space:]]*$//' \
  | awk -v f="$(basename "${file}")" 'NF { print f "\t" $0 }'
}

for file in "${CUSTOM_RULES_DIR}"/A*.yml "${CUSTOM_RULES_DIR}"/A*.yaml 2>/dev/null; do
  [ -f "${file}" ] || continue
  extract_patterns "${file}" >> "${tmp_patterns}"
done

if [ ! -s "${tmp_patterns}" ]; then
  echo "Паттернов в кастомных правилах не найдено."
  exit 0
fi

echo "==== Дубликаты паттернов в rules/custom ===="
echo

awk -F '\t' '
{
  file = $1
  pat  = $2
  key  = pat
  if (!(key in files_by_pat)) {
    files_by_pat[key] = file
    count[key] = 1
  } else {
    if (files_by_pat[key] !~ (file)) {
      files_by_pat[key] = files_by_pat[key] "," file
    }
    count[key]++
  }
}
END {
  dup_found = 0
  for (k in files_by_pat) {
    n_files = split(files_by_pat[k], arr, ",")
    if (count[k] > 1 && n_files > 1) {
      dup_found = 1
      printf "Паттерн:\n  %s\n", k
      printf "Файлы:\n"
      for (i = 1; i <= n_files; i++) {
        printf "  - %s\n", arr[i]
      }
      printf "\n"
    }
  }
  if (!dup_found) {
    print "Явных дубликатов паттернов между файлами не обнаружено."
  }
}
' "${tmp_patterns}"
