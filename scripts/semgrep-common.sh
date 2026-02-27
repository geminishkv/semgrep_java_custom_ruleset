#!/usr/bin/env bash
set -euo pipefail

GREEN=$'\033[0;32m'
YELLOW=$'\033[0;33m'
BLUE=$'\033[0;34m'
NC=$'\033[0m'

info() { echo "${GREEN}$*${NC}"; }
warn() { echo "${BLUE}$*${NC}"; }
