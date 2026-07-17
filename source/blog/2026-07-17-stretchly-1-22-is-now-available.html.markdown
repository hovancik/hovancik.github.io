---

title: "Stretchly 1.22 is now available"
date: 2026-07-17 6:00 +0000
tags: stretchly, release

---

Hi everyone,

I am really happy to announce, that **version 1.22 of [*Stretchly*](/stretchly) is here!** You can download it from [downloads](/stretchly/downloads) page.

Thanks to everyone for their [support](/stretchly/sponsor)!

### Added
- Windows installer now adds `stretchly` to PATH so CLI commands (e.g. `stretchly pause`) can be run from any terminal without specifying the full executable path
- advanced option `breakContentScreen` to show break countdown/idea only on the primary, cursor, or a specific screen while other screens stay blanked
- advanced option `trayIconThemeSource` (`system`, `light`, or `dark`) to set the tray icon's light or dark variant
- advanced options `monitorDndCheckInterval` and `naturalBreaksCheckInterval` to tune how often Do Not Disturb and idle time are checked

### Changed
- tray icon now follows the light/dark theme automatically; the manual "Inverted Monochrome" option was removed
- improved tray icons
- reduced background polling for Do Not Disturb, natural breaks, and app exclusions to 2 seconds to lower energy usage (`appExclusionsCheckInterval` default raised from `1000` to `2000`)
- reduced CPU and energy usage during breaks
- Do Not Disturb, natural breaks, and app exclusion monitoring are stopped while breaks are paused, to lower energy usage
- disable new end break shortcut registrations on native Wayland, where they could remain active after breaks and block the shortcut in other apps

### Fixed
- fix Windows notifications not using Stretchly's name and icon when started via the `stretchly` command
- fix crashes on system unlock
- fix window icon turning monochrome with the monochrome tray icon setting
- fix custom title for Mini break from command line
- fix repeated crash windows after an error
- improve double-click error prevention in breaks
- fix fullscreen breaks dropping out of their Space after a few seconds on macOS
- fix app exclusion state not updating in some cases
- fix text selection on break screens allowing escape via the macOS force-click dictionary
