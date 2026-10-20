# debloatfiretv

Debloat Amazon Fire TV devices over ADB and document what each system package does.

**Status:** research phase — collecting package inventories before deciding what is safe to disable.

## Approach

1. **Inventory** — dump packages and device info from a real device (`scripts/inventory.sh`).
2. **Research** — document each package in `research/` (what it does, what breaks without it).
3. **Debloat** — disable packages listed in `lists/disable.txt` with `pm disable-user` (reversible, no root).
4. **Restore** — re-enable anything with `scripts/restore.sh`.

Packages are only *disabled* for user 0, never uninstalled from the system partition, so a factory reset always brings everything back.

## Setup

```sh
brew install android-platform-tools
```

On the Fire TV: *Settings → My Fire TV → About* → click the device name 7× to unlock Developer Options, then *Developer Options → ADB debugging: ON*. Find the IP under *About → Network*.

```sh
adb connect <fire-tv-ip>:5555   # accept the prompt on the TV
```

## Usage

```sh
scripts/inventory.sh                    # snapshot packages into research/devices/<model>-<build>/
scripts/debloat.sh lists/disable.txt    # dry run: shows what would be disabled
scripts/debloat.sh lists/disable.txt -y # actually disable
scripts/restore.sh lists/disable.txt    # re-enable
```

## Layout

| Path | Purpose |
|------|---------|
| `scripts/` | ADB helper scripts |
| `lists/` | Package lists consumed by the scripts |
| `research/` | Notes on packages, device snapshots, findings |

## Disclaimer

Disabling the wrong system package can break the launcher, updates, or remote pairing. Test one package at a time; keep `adb` access working so you can always restore.
