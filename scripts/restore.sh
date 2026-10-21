#!/usr/bin/env bash
# Re-enable packages from one or more lists (undo debloat.sh).
set -euo pipefail

(( $# )) || { echo "usage: restore.sh <list>..." >&2; exit 1; }

{ grep -hvE '^\s*(#|$)' "$@" || true; } | while read -r pkg; do
  printf '%s: ' "$pkg"
  adb shell pm enable --user 0 "$pkg" </dev/null 2>&1 | tr -d '\r' | grep -m1 -iE 'new state|exception: ' | sed 's/^java.lang.//' || true
done
