# debloatfiretv

**Strip telemetry, ads and unused Amazon apps from a Fire TV, with nothing but ADB.** No root, no app to install, every change reversible.

![Fire OS 7](https://img.shields.io/badge/Fire%20OS-7-ff9900)
![Root](https://img.shields.io/badge/root-not%20required-2ea44f)
![Reversible](https://img.shields.io/badge/changes-reversible-2ea44f)
![License](https://img.shields.io/badge/license-MIT-blue)

- **Plain package lists.** Pick what you want gone, nothing hidden in code.
- **Researched, not guessed.** Every package is documented in [`research/packages.md`](research/packages.md) with what it does, what breaks without it and the device it was tested on.
- **Disable, never uninstall.** Packages are disabled for user 0 with `pm disable-user`. `restore.sh` brings them back, and a factory reset always does.

## What it does

| List | Removes | Who should use it |
|------|---------|-------------------|
| [`telemetry-ads.txt`](lists/telemetry-ads.txt) | Automatic Content Recognition (screen fingerprinting), metrics and log uploads, advertising ID, "Special Offers" ads, autoplay trailers, shopping overlays | Everyone |
| [`amazon-apps.txt`](lists/amazon-apps.txt) | Ambient mode, Amazon Photos & Music, games/Luna, Amazon Kids, News, Silk browser, tutorials, upsell prompts, printing | Most people. Skip it if you use any of these |
| [`alexa.txt`](lists/alexa.txt) | Alexa voice, alarms, notifications, skills, calling | Only if you never use the voice remote. Matter keeps working |
| [`tuner-hbbtv.txt`](lists/tuner-hbbtv.txt) | Channel scan and HbbTV (red button) | Fire TV **smart TVs** without antenna/cable/satellite |

**Never touched:** home screen, Settings, Appstore, account/login, system updates, HDMI inputs, AirPlay and casting, Matter, screensaver, and all apps you installed yourself.

## Quick start

1. **On the Fire TV:** *Settings → My Fire TV (or Device & Software) → About*, click the device name 7 times. Then *Developer Options → ADB debugging: ON*. Note the IP under *About → Network*.
2. **On your computer:** install ADB and connect.

   ```sh
   brew install android-platform-tools        # macOS; Linux: apt install adb
   git clone https://github.com/jannikloehr/debloatfiretv && cd debloatfiretv
   adb connect <fire-tv-ip>:5555              # accept the prompt on the TV
   ```

3. **Dry run, then apply:**

   ```sh
   scripts/debloat.sh lists/telemetry-ads.txt lists/amazon-apps.txt      # shows what would happen
   scripts/debloat.sh -y lists/telemetry-ads.txt lists/amazon-apps.txt   # does it
   ```

4. **Undo anytime:**

   ```sh
   scripts/restore.sh lists/amazon-apps.txt
   ```

Packages that Fire OS protects are reported (`Cannot disable a protected package`) and skipped.

## Also worth doing

- *Settings → Preferences → Privacy settings:* turn off device usage data, app usage data and interest-based ads.
- *Settings → Preferences → Featured content:* turn off video and audio autoplay.
- **DNS filter** (AdGuard Home, Pi-hole, NextDNS): blocks the [protected telemetry packages](research/packages.md#protected) that ADB can't disable.
- **Faster menus:** `adb shell settings put global window_animation_scale 0.5` (same for `transition_animation_scale` and `animator_duration_scale`).

## Tested devices

| Device | Model | Fire OS | Lists |
|--------|-------|---------|-------|
| Fire TV 2-Series (2023) | AFTKAUK002 | 7.7.1.7 | all four |

Other Fire OS 7/8 devices share most packages. A package missing on your device is harmless: `pm` just reports it as unknown.

**Not supported:** devices running **Vega OS** (e.g. Fire TV Stick 4K Select, 2025). They are not Android, and ADB debloating does not apply.

## Contributing a device

Have a different Fire TV? A snapshot helps everyone:

```sh
scripts/inventory.sh    # writes research/devices/<model>-<fire-os>/
```

Open a pull request with that folder and add any packages you tested to [`research/packages.md`](research/packages.md). Only mark a package `safe` after the home screen, Settings and your usual apps still worked with it disabled.

## FAQ

**Will a Fire OS update undo this?** Usually not: disabled packages stay disabled. Updates can add new Amazon apps, so re-run `inventory.sh` and the lists after a big update.

**Can I replace the Amazon home screen?** Fire OS 7.6+ ignores custom default launchers. Launchers like Projectivy work around it with an accessibility service. Don't disable `com.amazon.tv.launcher`: it also hosts Settings.

**Something broke.** Run `scripts/restore.sh` on the list you applied last. If ADB is unreachable, a factory reset restores every package.

## Disclaimer

Not affiliated with Amazon. You use this at your own risk. Everything here only disables packages for the current user and is reversible, but test one list at a time and keep ADB access working.

[MIT License](LICENSE)
