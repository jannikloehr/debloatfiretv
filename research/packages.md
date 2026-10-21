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

## Wave 2 — unused features (decide per household)

| Package | What it does | Disable effect | Verdict | Tested on |
|---------|--------------|----------------|---------|-----------|
| com.amazon.ftv.screensaver | Amazon screensaver | Falls back to blank/Android daydream | ? | |
| com.amazon.tv.ftvambient | Ambient Experience (art/widgets when idle) | No ambient mode | ? | |
| com.amazon.bueller.photos | Amazon Photos screensaver/app | No Amazon Photos | ? | |
| com.amazon.bueller.music | Amazon Music integration | No Amazon Music app | ? | |
| com.amazon.gamehub | Luna/games hub | No games row | ? | |
| com.amazon.minitv.android.app | Amazon miniTV (India) | None | ? | |
| com.amazon.tahoe | Amazon Kids (FreeTime) | No Kids profiles | ? | |
| com.amazon.tv.easyupgrade | Upsell prompts | None expected | ? | |
| com.amazon.tv.democontent.provider | Store-demo content | None | ? | |
| com.amazon.storm.lightning.tutorial | Onboarding tutorial | None | ? | |
| com.amazon.tmm.tutorial | Onboarding tutorial | None | ? | |
| com.amazon.tv.releasenotes | "What's new" after updates | None | ? | |
| com.amazon.rtcsessioncontroller | Alexa calling/video calls | No calls | ? | |
| com.amazon.tv.alexaalerts | Alexa alarms/timers on TV | No alarms on TV | caution | |
| com.amazon.tv.alexanotifications | Alexa notification banners | No Alexa banners | caution | |
| com.amazon.tv.matter / com.amazon.tv.mattercohost | Matter smart-home controller | Matter devices not controllable via TV | caution | |
| com.android.printspooler / com.android.bips | Printing | None on a TV | ? | |

## Keep — essential or likely to break things

| Package | Why |
|---------|-----|
| com.amazon.tv.launcher, com.amazon.firehomestarter | Home screen. Do not disable without a replacement launcher |
| com.amazon.tv.livetv, com.amazon.mediatek.livetv, com.mediatek.tv*, com.amazon.tv.channelscan, com.amazon.franktvinput | Tuner, inputs, live TV on this TV model |
| com.vewd.core.* | HbbTV/broadcast apps (red button, ARD/ZDF Mediathek via tuner) |
| com.amazon.venezia | Appstore. Without it, apps no longer update |
| com.amazon.dcp, com.amazon.identity.*, com.amazon.tcomm* | Account/login, needed by Prime Video etc. |
| com.amazon.tv.settings*, com.amazon.tv.ime, com.amazon.tv.quicksettings* | Settings, keyboard |
| com.amazon.device.software.ota*, com.amazon.tv.forcedotaupdater.v2 | System updates. Disabling blocks security fixes (`caution`, not in lists) |
| com.amazon.webview.chromium | WebView used by many apps |
| com.apple.airplay.amazon.airplay, com.amazon.cast.sink | AirPlay / casting, if used |
| com.amazon.vizzini, com.amazon.alexa* | Alexa voice remote. Only disable if voice is never used |
| ar.tvplayer.tv (TiviMate), com.netflix.ninja, com.amazon.firetv.youtube | User apps in daily use. Never touch |
