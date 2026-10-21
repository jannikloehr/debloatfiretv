# Package research

One section per list in `lists/`, plus packages that must stay and packages Fire OS refuses to disable.

**Verdicts:** `safe` (disabled and checked on a real device), `caution` (works, but with side effects), `keep` (breaks something essential, or kept on purpose), `protected` (Fire OS refuses `pm disable-user` without root), `?` (untested).

"What it does" comes from package names, manifests and community reports (XDA, AFTVnews). A package is only `safe` after it was disabled on a real device and the home screen, Settings and common apps (Netflix, YouTube, TiviMate) still worked.

**Tested on:** `T1` = Fire TV 2-Series (2023), `AFTKAUK002` / `anna`, MediaTek, Fire OS 7.7.1.7 (PS7717/5741). Raw snapshot in [`devices/`](devices/).

## `telemetry-ads.txt`

| Package | What it does | Disable effect | Verdict | Tested on |
|---------|--------------|----------------|---------|-----------|
| com.amazon.tv.acr | Automatic Content Recognition: fingerprints what is on screen (incl. HDMI/tuner) for ad targeting | None noticed | safe | T1 |
| com.amazon.tv.fw.metrics | Fire TV framework metrics | None noticed | safe | T1 |
| com.amazon.wirelessmetrics.service | Wi-Fi/BT metrics upload | None noticed | safe | T1 |
| com.amazon.perfcollection | Performance data collection | None noticed | safe | T1 |
| com.amazon.dp.logger | Device-platform logging | None noticed | safe | T1 |
| com.amazon.logan | Log upload agent | None noticed | safe | T1 |
| com.amazon.neo.minerva.logcat | Logcat collection for Minerva telemetry | None noticed | safe | T1 |
| com.amazon.connectivitydiag | Network diagnostics | None noticed | safe | T1 |
| com.amazon.hybridadidservice | Advertising ID service | Apps get no Amazon ad ID | safe | T1 |
| com.amazon.kso.blackbird | "Special Offers" ads | Fewer ads | safe | T1 |
| com.amazon.sneakpeek | Auto-playing trailer previews on the home screen | No autoplay previews | safe | T1 |
| com.amazon.shoptv.client | Shopping overlays | None noticed | safe | T1 |

## `amazon-apps.txt`

| Package | What it does | Disable effect | Verdict | Tested on |
|---------|--------------|----------------|---------|-----------|
| com.amazon.tv.ftvambient | Ambient Experience (art/widgets when idle) | No ambient mode | safe | T1 |
| com.amazon.bueller.photos | Amazon Photos app/screensaver source | No Amazon Photos | safe | T1 |
| com.amazon.bueller.music | Amazon Music integration | No Amazon Music | safe | T1 |
| com.amazon.gamehub | Luna/games hub | No games row | safe | T1 |
| com.amazon.recess | Casual games hub | No games | safe | T1 |
| com.amazon.minitv.android.app | Amazon miniTV (India) | None | safe | T1 |
| com.amazon.naatyam | India content stub | None | safe | T1 |
| com.amazon.tahoe | Amazon Kids (FreeTime) | No Kids profiles | safe | T1 |
| com.amazon.hedwig | Amazon News | No News app | safe | T1 |
| com.amazon.cloud9 | Silk browser | No browser | safe | T1 |
| com.amazon.tv.easyupgrade | Upsell prompts | None | safe | T1 |
| com.amazon.tv.democontent.provider | Store-demo content | None | safe | T1 |
| com.amazon.storm.lightning.tutorial | Onboarding tutorial | None | safe | T1 |
| com.amazon.tmm.tutorial | Onboarding tutorial | None | safe | T1 |
| com.amazon.tv.releasenotes | "What's new" after updates | None | safe | T1 |
| com.android.printspooler / com.android.bips | Printing | None on a TV | safe | T1 |

## `alexa.txt`

Matter (`com.amazon.tv.matter*`) holds Alexa permissions (`SEND_DATA_TO_ALEXA`, `CREATE_ALEXA_NOTIFICATIONS`), so the Alexa backend stays enabled (see [Keep](#keep)).

| Package | What it does | Disable effect | Verdict | Tested on |
|---------|--------------|----------------|---------|-----------|
| com.amazon.vizzini | Alexa voice UI | Voice button on the remote does nothing | safe | T1 |
| com.amazon.tv.alexaalerts | Alexa alarms/timers on TV | No alarms on TV | safe | T1 |
| com.amazon.tv.alexanotifications | Alexa notification banners | No Alexa banners | safe | T1 |
| com.amazon.firetv.androidskillconnectioncapability | Alexa skills controlling apps | "Alexa, play X in app Y" stops working | safe | T1 |
| com.amazon.alexa.externalmediaplayer.fireos / com.amazon.alexamediaplayer.runtime.ftv | Alexa music/media playback | No Alexa music on TV | safe | T1 |
| com.amazon.rtcsessioncontroller | Alexa calling/video calls | No calls | safe | T1 |

## `tuner-hbbtv.txt`

Only on Fire TV smart TVs. Only disable if no antenna/cable/satellite tuner is used.

| Package | What it does | Disable effect | Verdict | Tested on |
|---------|--------------|----------------|---------|-----------|
| com.amazon.tv.channelscan (+ `.annakt.overlay`) | Tuner channel scan | No channel search | safe | T1 |
| com.vewd.core.* (fvpplayer, fvpsign, service, tis, tvapp) | HbbTV/Freeview Play (red button) | No HbbTV | safe | T1 |

## Protected

Fire OS refuses to disable these without root (`SecurityException: Cannot disable a protected package`). Block their traffic with a DNS filter (AdGuard Home, Pi-hole, NextDNS) instead.

| Package | What it does | Tested on |
|---------|--------------|-----------|
| com.amazon.device.metrics | Device metrics upload | T1 |
| com.amazon.device.crashmanager | Crash report upload | T1 |
| com.amazon.device.logmanager | Log manager | T1 |
| com.amazon.adep | Analytics/data event pipeline | T1 |
| com.amazon.tv.csapp | Customer-service data collection | T1 |
| com.fireos.usagestats.proxy | App usage stats | T1 |
| com.amazon.ftvads.deeplinking | Deep links from home-screen ads | T1 |

## Keep

| Package | Why |
|---------|-----|
| com.amazon.tv.launcher, com.amazon.firehomestarter | Home screen (also hosts Settings). Do not disable without a replacement launcher |
| com.amazon.tv.livetv, com.amazon.mediatek.livetv, com.mediatek.tv*, com.amazon.franktvinput, com.amazon.tifobserver | HDMI inputs and the live TV framework (also used by IPTV apps' channel integration) |
| com.amazon.venezia | Appstore. Without it, apps no longer update |
| com.amazon.dcp, com.amazon.identity.*, com.amazon.tcomm*, com.amazon.imp | Account/login, needed by Prime Video etc. |
| com.amazon.tv.settings*, com.amazon.tv.ime, com.amazon.tv.quicksettings* | Settings, keyboard |
| com.amazon.device.software.ota*, com.amazon.tv.forcedotaupdater.v2 | System updates. Disabling blocks security fixes |
| com.amazon.webview.chromium | WebView used by many apps |
| com.amazon.ftv.screensaver | Screensaver. On TVs it protects the panel from burn-in |
| com.apple.airplay.amazon.airplay, com.amazon.cast.sink, com.amazon.dialservice | AirPlay, casting, DIAL (YouTube/Netflix "cast to TV") |
| com.amazon.whisperlink.*, com.amazon.whisperplay.* | Device discovery for the Fire TV phone remote app and Fling |
| com.amazon.tv.matter, com.amazon.tv.mattercohost | Matter smart-home controller |
| com.amazon.alexadirectivebrokerservice, com.amazon.alexa.datastore.app, amazon.speech.davs.davcservice | Alexa backend, used by Matter |
| com.android.documentsui | File picker (e.g. restoring app backups) |
| com.amazon.device.messaging* | Push messaging for Amazon apps |
| com.ivona.*, com.svox.pico | Text-to-speech (VoiceView accessibility) |

Third-party apps (Netflix, YouTube, TiviMate, …) are never touched.

## Comparison with firestrip

[WB2024/firestrip](https://github.com/WB2024/firestrip) (checked 2026-10-21) lists 158 packages in `common.toml`. Findings on T1:

- Its `settings put` privacy keys (`amazon:device_metrics_opt_in`, `amazon:acr_enabled`, `amazon:sidewalk_enabled`, …) do not exist on Fire OS 7.7.1.7 (`settings get` → `null`), so writing them has no effect. The real keys are `amz_limit_ad_tracking`, `advertisingIdApp:interestBasedAds:value` and `USAGE_METRICS_UPLOAD_ENABLED`, set through *Settings → Preferences → Privacy settings*.
- Its `telemetry` tier includes packages that are [protected](#protected) here.
- Some descriptions look wrong for Fire TV: `whisperlink`/`whisperplay` is device discovery (phone remote, Fling), not Sidewalk; `dialservice` is DIAL casting.
- Taken from it after testing: `connectivitydiag`, `hedwig`, `recess`, `cloud9`, `naatyam`.
- Not taken from its `safe` list: `documentsui`, `tifobserver`, `franktvinput`, `dialservice`, `device.messaging`, TTS engines (see [Keep](#keep)).

## Notes

- `adb exec-out screencap -p` on T1 prepends a log line ("Init wrapper sys mutex…"); strip everything before the PNG header to get a valid image.
- Mixed English/German Settings on T1 is not caused by debloating: Fire OS renamed the top-level Settings tiles ("My Fire TV" → "Device & Software"), and those new strings exist only in English in `com.amazon.tv.settings.v2`. The German overlay `com.amazon.tv.settings.v2.overlay.localisation.common` (updated 2026-10-20, before any debloating) only translates the old names, so Android falls back to English for the tiles while the unchanged submenus stay German.
