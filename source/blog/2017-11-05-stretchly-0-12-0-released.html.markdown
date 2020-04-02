---
title: stretchly 0.12.0 released
date: 2017-11-05 15:00 UTC
tags: stretchly
---

Hi there guys, I am really happy to release version 0.12.0 of [*stretchly*](/stretchly). You can download it from [github](https://github.com/hovancik/stretchly/releases/tag/v0.12.0).

*stretchly* is cross-platform open source app that reminds you to take breaks when working with computer.

### Fixed
- error with second instance on Windows
- breaks wont resume with indefinite pause after system resume

### Added
- monitoring of system idle time for natural breaks (when user leaves and after return idle time is greater then break duration, *stretchly* will reset breaks)
- menu link to Patreon

### Changed
- microbreak notifications are 10 seconds before and can be disabled
