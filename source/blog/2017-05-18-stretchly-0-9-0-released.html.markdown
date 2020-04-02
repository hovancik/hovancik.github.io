---
title: stretchly 0.9.0 released
date: 2017-05-18 07:32 UTC
tags: stretchly
---

Hi there guys, I am really happy to release version 0.9.0 of [*stretchly*](/stretchly). You can download it from [github](https://github.com/hovancik/stretchly/releases/tag/v0.9.0).

*stretchly* is cross-platform open source app that reminds you to take breaks when working with computer.

<img src="/img/stretchly-0.8.0.png" alt="stretchly" width="100%"/>

### Added
- Tooltip shows information about:
  - time left till next (micro)break
  - time left in pause till breaks resume
  - number of microbreaks until next break

### Fixed
- version checker erroneous 'a new version is available' messages
- Run breaks after resetting breaks
- Scheduler timeLeft based on actual setTimeout start time

### Changed
- do not play sound on Pause when break is in progress
- cosmetic style changes
- do not hide macOS dock icon, so we can have tray tooltip

### Known issues
- tray tooltip does not work correctly on macOS

Thanks a lot goes to Sean Manton, who implemented some of those features!
