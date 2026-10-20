#!/usr/bin/env bash
# Re-enable packages from a list (undo debloat.sh).
set -euo pipefail

list=${1:?usage: restore.sh <list>}

{ grep -vE '^\s*(#|$)' "$list" || true; } | while read -r pkg; do
  printf '%s: ' "$pkg"
  adb shell pm enable --user 0 "$pkg" </dev/null | tr -d '\r'
done
