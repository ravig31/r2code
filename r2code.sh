#!/usr/bin/env bash

# Assumes passwordless SSH is setup both ways (host ↔ remote). 

set -euo pipefail

HOST_ALIAS="${HOST_ALIAS:example-host-alias}"
REMOTE_ALIAS="${REMOTE_ALIAS:example-remote-alias}" # Remote alias on your host machine
PROJECT_PATH="${1:-$PWD}"

# Path to VScode on host machine, might need to change
HOST_CODE_BIN="${HOST_CODE_BIN:-/usr/local/bin/code}" 

# 1) choose a free remote port
pick_port() {
  local p=9000
  while ss -ltn 2>/dev/null | awk '{print $4}' | grep -q ":$p$"; do p=$((p+1)); done
  echo "$p"
}
RPORT="$(pick_port)"

# 2) one-shot tunnel + run code on the host 
ssh -R "${RPORT}:localhost:22" \
    "${HOST_ALIAS}" \
    "\"$HOST_CODE_BIN\" --remote ssh-remote+${REMOTE_ALIAS} \"${PROJECT_PATH}\""

