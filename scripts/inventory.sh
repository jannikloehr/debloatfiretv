#!/usr/bin/env bash
# Snapshot device info and package state into research/devices/<model>-<build>/.
set -euo pipefail

command -v adb >/dev/null || { echo "adb not found (brew install android-platform-tools)" >&2; exit 1; }
adb get-state >/dev/null 2>&1 || { echo "no device connected (adb connect <ip>:5555)" >&2; exit 1; }

prop() { adb shell getprop "$1" | tr -d '\r'; }

slug() { tr -c 'A-Za-z0-9.\n-' '_'; }

model=$(prop ro.product.model | slug)
build=$(prop ro.build.version.name | slug)
out="$(dirname "$0")/../research/devices/${model:-unknown}-${build:-unknown}"
mkdir -p "$out"

{
  echo "model:        $(prop ro.product.model)"
  echo "device:       $(prop ro.product.device)"
  echo "fire_os:      $(prop ro.build.version.name)"
  echo "android:      $(prop ro.build.version.release)"
  echo "sdk:          $(prop ro.build.version.sdk)"
  echo "build:        $(prop ro.build.display.id)"
  echo "captured:     $(date -u +%Y-%m-%dT%H:%M:%SZ)"
} > "$out/device.txt"

pkgs() { adb shell pm list packages "$@" | tr -d '\r' | sed 's/^package://' | sort; }

pkgs -s > "$out/system.txt"
pkgs -3 > "$out/third-party.txt"
pkgs -d > "$out/disabled.txt"
adb shell pm list packages -f -s | tr -d '\r' | sed 's/^package://' | sort > "$out/system-paths.txt"

echo "wrote $out"
wc -l "$out"/*.txt | sed '$d'
