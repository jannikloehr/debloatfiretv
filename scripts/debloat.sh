#!/usr/bin/env bash
# Disable packages from a list for user 0. Dry run unless -y is given.
set -euo pipefail

list=${1:?usage: debloat.sh <list> [-y]}
apply=${2:-}

{ grep -vE '^\s*(#|$)' "$list" || true; } | while read -r pkg; do
  if [[ $apply == -y ]]; then
    printf '%s: ' "$pkg"
    adb shell pm disable-user --user 0 "$pkg" </dev/null 2>&1 | tr -d '\r' | head -1 || true
  else
    echo "would disable: $pkg"
  fi
done

[[ $apply == -y ]] || echo "(dry run — pass -y to apply)"
