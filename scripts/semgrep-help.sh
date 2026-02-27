#!/usr/bin/env bash
set -euo pipefail

JAVA_RULES_DIR=${1:-rules/official-java-semgrep/java}
CUSTOM_RULES_DIR=${2:-rules/custom}
SRC_DIR=${3:-src}
REPORT_DIR=${4:-reports}

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "${SCRIPT_DIR}/semgrep-common.sh"

reset=$'\033[0m'

cat <<EOF
${GREEN}Semgrep Custom Java Rules Management${NC}

${BLUE}Инициализация:${NC}
  java_recon init            - Инициализировать подмодуль с Java‑правилами (первый запуск)

${BLUE}Обновление:${NC}
  java_recon update-rules    - Обновить Java‑правила до последней версии
  java_recon commit-rules    - Закоммитить обновлённые правила
  java_recon dedupe          - Найти дубликаты паттернов в кастомных правилах

${BLUE}Сканирование:${NC}
  java_recon scan            - Полное сканирование всеми правилами (JSON‑отчёт)
  java_recon scan-official   - Сканировать только официальными Java‑правилами
  java_recon scan-custom     - Сканировать только кастомными правилами
  java_recon scan-critical   - Сканировать только критичные уязвимости
  java_recon scan-ci         - Сканирование для CI/CD (JSON и SARIF‑отчёты)

${BLUE}Обслуживание:${NC}
  java_recon validate        - Проверить валидность кастомных правил
  java_recon stats           - Показать статистику по правилам
  java_recon status          - Показать состояние подмодуля
  java_recon clean           - Удалить каталог с отчётами
  java_recon dist-clean      - Удалить отчёты и кеши

${BLUE}Конфигурация (по умолчанию):${NC}
  JAVA_RULES_DIR             = ${JAVA_RULES_DIR}
  CUSTOM_RULES_DIR           = ${CUSTOM_RULES_DIR}
  SRC_DIR                    = ${SRC_DIR}
  REPORT_DIR                 = ${REPORT_DIR}
EOF

banner_bottom=$'
                                                                      
 @@@@@@  @@@@@@@  @@@@@@@   @@@@@@ @@@@@@@@  @@@@@@@ @@@@@@@  @@@@@@  
@@!  @@@ @@!  @@@ @@!  @@@ !@@     @@!      !@@        @!!   @@!  @@@ 
@!@!@!@! @!@@!@!  @!@@!@!   !@@!!  @!!!:!   !@!        @!!   @!@!@!@! 
!!:  !!! !!:      !!:          !:! !!:      :!!        !!:   !!:  !!! 
 :   : :  :        :       ::.: :  : :: ::   :: :: :    :     :   : : 
                                                                      
                                                                      
                                                     Sic Parvis Magna'

printf '%s\n' "$banner_bottom" \
  | sed "s/^/${BLUE}/; s/$/${reset}/"
