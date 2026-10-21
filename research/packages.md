# Package research

One row per package. Verdict: `safe` (disable freely), `caution` (side effects noted), `keep` (breaks something essential), `?` (untested), `protected` (Fire OS refuses `pm disable-user` without root).

"What it does" is based on package names, manifests and community reports (XDA, AFTVnews); nothing here is `safe` until disabled and checked on a real device.

Reference device: `AFTKAUK002` (`anna`, Fire TV smart TV, MediaTek), Fire OS 7.7.1.7 — see `research/devices/`.

## Wave 1 — telemetry & ads (lowest risk, in `lists/disable.txt`)

| Package | What it does | Disable effect | Verdict | Tested on |
|---------|--------------|----------------|---------|-----------|
| com.amazon.tv.acr | Automatic Content Recognition: fingerprints what is on screen (incl. HDMI/tuner) for ad targeting | None expected | safe | AFTKAUK002 / 7.7.1.7 |
| com.amazon.device.metrics | Uploads device metrics to Amazon | protected (cannot disable) | protected | AFTKAUK002 / 7.7.1.7 |
| com.amazon.tv.fw.metrics | Fire TV framework metrics | None expected | safe | AFTKAUK002 / 7.7.1.7 |
| com.amazon.wirelessmetrics.service | Wi-Fi/BT metrics upload | None expected | safe | AFTKAUK002 / 7.7.1.7 |
| com.amazon.perfcollection | Performance data collection | None expected | safe | AFTKAUK002 / 7.7.1.7 |
| com.amazon.device.crashmanager | Uploads crash reports/tombstones | protected (cannot disable) | protected | AFTKAUK002 / 7.7.1.7 |
| com.amazon.dp.logger | Device-platform logging | None expected | safe | AFTKAUK002 / 7.7.1.7 |
| com.amazon.logan | Log upload agent | None expected | safe | AFTKAUK002 / 7.7.1.7 |
| com.amazon.neo.minerva.logcat | Logcat collection for Minerva telemetry | None expected | safe | AFTKAUK002 / 7.7.1.7 |
| com.fireos.usagestats.proxy | Forwards app usage stats | protected (cannot disable) | protected | AFTKAUK002 / 7.7.1.7 |
| com.amazon.hybridadidservice | Advertising ID service | Apps get no Amazon ad ID | safe | AFTKAUK002 / 7.7.1.7 |
| com.amazon.ftvads.deeplinking | Deep links from home-screen ads | protected (cannot disable) | protected | AFTKAUK002 / 7.7.1.7 |
| com.amazon.kso.blackbird | "Special Offers" (lock-screen/home ads) | Fewer ads | safe | AFTKAUK002 / 7.7.1.7 |
| com.amazon.sneakpeek | Auto-playing trailer previews on home screen | No autoplay previews | safe | AFTKAUK002 / 7.7.1.7 |
| com.amazon.shoptv.client | Shopping overlays | None expected | safe | AFTKAUK002 / 7.7.1.7 |

## Wave 2 — unused features (in `lists/wave2.txt`)

| Package | What it does | Disable effect | Verdict | Tested on |
|---------|--------------|----------------|---------|-----------|
| com.amazon.ftv.screensaver | Amazon screensaver | Falls back to blank/Android daydream. Kept: protects the TV panel from burn-in | keep | |
| com.amazon.tv.ftvambient | Ambient Experience (art/widgets when idle) | No ambient mode | safe | AFTKAUK002 / 7.7.1.7 |
| com.amazon.bueller.photos | Amazon Photos screensaver/app | No Amazon Photos | safe | AFTKAUK002 / 7.7.1.7 |
| com.amazon.bueller.music | Amazon Music integration | No Amazon Music app | safe | AFTKAUK002 / 7.7.1.7 |
| com.amazon.gamehub | Luna/games hub | No games row | safe | AFTKAUK002 / 7.7.1.7 |
| com.amazon.minitv.android.app | Amazon miniTV (India) | None | safe | AFTKAUK002 / 7.7.1.7 |
| com.amazon.tahoe | Amazon Kids (FreeTime) | No Kids profiles | safe | AFTKAUK002 / 7.7.1.7 |
| com.amazon.tv.easyupgrade | Upsell prompts | None expected | safe | AFTKAUK002 / 7.7.1.7 |
| com.amazon.tv.democontent.provider | Store-demo content | None | safe | AFTKAUK002 / 7.7.1.7 |
| com.amazon.storm.lightning.tutorial | Onboarding tutorial | None | safe | AFTKAUK002 / 7.7.1.7 |
| com.amazon.tmm.tutorial | Onboarding tutorial | None | safe | AFTKAUK002 / 7.7.1.7 |
| com.amazon.tv.releasenotes | "What's new" after updates | None | safe | AFTKAUK002 / 7.7.1.7 |
| com.amazon.rtcsessioncontroller | Alexa calling/video calls | No calls | safe | AFTKAUK002 / 7.7.1.7 |
| com.amazon.tv.alexaalerts | Alexa alarms/timers on TV | No alarms on TV | caution | |
| com.amazon.tv.alexanotifications | Alexa notification banners | No Alexa banners | caution | |
| com.amazon.tv.channelscan (+ .annakt.overlay) | Tuner channel scan | No channel search. Only fine without antenna/cable/satellite | safe | AFTKAUK002 / 7.7.1.7 |
| com.vewd.core.* (fvpplayer, fvpsign, service, tis, tvapp) | HbbTV/Freeview Play broadcast apps (red button) | No HbbTV. Only matters with an active tuner | safe | AFTKAUK002 / 7.7.1.7 |
| com.amazon.tv.matter / com.amazon.tv.mattercohost | Matter smart-home controller | Matter devices not controllable via TV. Kept: in use | keep | |
| com.android.printspooler / com.android.bips | Printing | None on a TV | safe | AFTKAUK002 / 7.7.1.7 |

## Alexa front end (in `lists/alexa.txt`)

Matter (`com.amazon.tv.matter*`) holds Alexa permissions (`SEND_DATA_TO_ALEXA`, `CREATE_ALEXA_NOTIFICATIONS`), so the Alexa backend (`com.amazon.alexadirectivebrokerservice`, `com.amazon.alexa.datastore.app`, `amazon.speech.davs.davcservice`) stays enabled.

| Package | What it does | Disable effect | Verdict | Tested on |
|---------|--------------|----------------|---------|-----------|
| com.amazon.vizzini | Alexa voice UI on the TV | Mic button on the remote does nothing | safe | AFTKAUK002 / 7.7.1.7 |
| com.amazon.tv.alexaalerts | Alexa alarms/timers on TV | No alarms on TV | safe | AFTKAUK002 / 7.7.1.7 |
| com.amazon.tv.alexanotifications | Alexa notification banners | No Alexa banners | safe | AFTKAUK002 / 7.7.1.7 |
| com.amazon.firetv.androidskillconnectioncapability | Alexa skills controlling apps | "Alexa, play X in app Y" stops working | safe | AFTKAUK002 / 7.7.1.7 |
| com.amazon.alexa.externalmediaplayer.fireos / com.amazon.alexamediaplayer.runtime.ftv | Alexa music/media playback on TV | No Alexa music on TV | safe | AFTKAUK002 / 7.7.1.7 |

## Keep — essential or likely to break things

| Package | Why |
|---------|-----|
| com.amazon.tv.launcher, com.amazon.firehomestarter | Home screen. Do not disable without a replacement launcher |
| com.amazon.tv.livetv, com.amazon.mediatek.livetv, com.mediatek.tv*, com.amazon.franktvinput | HDMI inputs and the live TV framework (also used by TiviMate's channel integration) |
| com.amazon.venezia | Appstore. Without it, apps no longer update |
| com.amazon.dcp, com.amazon.identity.*, com.amazon.tcomm* | Account/login, needed by Prime Video etc. |
| com.amazon.tv.settings*, com.amazon.tv.ime, com.amazon.tv.quicksettings* | Settings, keyboard |
| com.amazon.device.software.ota*, com.amazon.tv.forcedotaupdater.v2 | System updates. Disabling blocks security fixes (`caution`, not in lists) |
| com.amazon.webview.chromium | WebView used by many apps |
| com.apple.airplay.amazon.airplay, com.amazon.cast.sink | AirPlay / casting, if used |
| com.amazon.alexadirectivebrokerservice, com.amazon.alexa.datastore.app, amazon.speech.davs.davcservice | Alexa backend, used by Matter |
| ar.tvplayer.tv (TiviMate), com.netflix.ninja, com.amazon.firetv.youtube | User apps in daily use. Never touch |

## Comparison with firestrip

[WB2024/firestrip](https://github.com/WB2024/firestrip) (checked 2026-10-21, last push 2026-05-08) lists 158 packages in `common.toml`. Notes for this device:

- Its `settings put` privacy keys (`amazon:device_metrics_opt_in`, `amazon:acr_enabled`, `amazon:sidewalk_enabled`, …) do not exist here (`settings get` → `null`), so writing them has no effect on Fire OS 7.7.1.7. The real keys are `amz_limit_ad_tracking=1`, `advertisingIdApp:interestBasedAds:value=0` and `USAGE_METRICS_UPLOAD_ENABLED=0`, already in the privacy-friendly state.
- Its `telemetry` tier includes the protected `com.amazon.device.metrics` and `com.amazon.ftvads.deeplinking` (refused here without root).
- Several of its descriptions look wrong for Fire TV: `com.amazon.whisperlink.*` / `whisperplay.*` is Amazon's device discovery (Fire TV phone remote, Fling), not Sidewalk; `com.amazon.dialservice` is DIAL casting (YouTube/Netflix "cast to TV").
- Candidates it marks `safe`/`telemetry` that are not in our lists yet (untested here): `com.amazon.adep` (analytics pipeline), `com.amazon.tv.csapp`, `com.amazon.connectivitydiag`, `com.amazon.device.logmanager`, `com.amazon.hedwig` (News), `com.amazon.recess` (games), `com.amazon.cloud9` (Silk browser), `com.amazon.naatyam`.
- Not taking from its `safe` list: `com.android.documentsui` (file picker, e.g. TiviMate backup restore), `com.amazon.tifobserver` / `com.amazon.franktvinput` (live TV channels), `com.amazon.dialservice`, `com.amazon.device.messaging` (push for Amazon apps), TTS engines (accessibility).
