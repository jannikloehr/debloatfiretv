#!/usr/bin/env bash
# Disable packages from one or more lists for user 0. Dry run unless -y is given.
set -euo pipefail

apply=
[[ ${1:-} == -y ]] && { apply=1; shift; }
(( $# )) || { echo "usage: debloat.sh [-y] <list>..." >&2; exit 1; }

{ grep -hvE '^\s*(#|$)' "$@" || true; } | while read -r pkg; do
  if [[ $apply ]]; then
    printf '%s: ' "$pkg"
    adb shell pm disable-user --user 0 "$pkg" </dev/null 2>&1 | tr -d '\r' | grep -m1 -iE 'new state|exception: ' | sed 's/^java.lang.//' || true
  else
    echo "would disable: $pkg"
  fi
done

[[ $apply ]] || echo "(dry run — pass -y to apply)"
