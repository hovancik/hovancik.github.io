---
title: stretchly 0.10.0 released
date: 2017-08-23 16:55 UTC
tags: stretchly
category: software developer
---

Hi there guys, I am really happy to release version 0.10.0 of [*stretchly*](/stretchly). You can download it from [github](https://github.com/hovancik/stretchly/releases/tag/v0.10.0).

*stretchly* is cross-platform open source app that reminds you to take breaks when working with computer.

### Added
- `Ctrl/Cmd + d` shortcut in About window to show debug information
- monitoring suspend/resume (alfa, electron has bugs)
- link to my.stretchly.net in menu

### Fixed
- break is not skippable via shortcut in strict mode
- macOS tooltip works without dock icon (after packaging)
- close break windows on `Reset breaks`

### Changed
- rewrite break management using Events
- get active settings when changing Settings window pages

