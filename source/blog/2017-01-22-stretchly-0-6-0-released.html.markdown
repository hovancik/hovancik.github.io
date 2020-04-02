---
title: stretchly 0.6.0 released
date: 2017-01-22 11:31 UTC
tags: stretchly
---

Hi there guys, I am really happy to release version 0.6.0 of [*stretchly*](/stretchly). You can download it from [github](https://github.com/hovancik/stretchly/releases/tag/v0.6.0).

*stretchly* is cross-platform open source app that reminds you to take breaks when working with computer.

### Added
- possibility to change break/microbreak ideas via editing config file

### Changed
- break window is shown when it's ready

### So how to change break ideas?
First, make sure you know what you are doing. This feature is meant for advanced users.  

To change break ideas, you need to edit config file. To learn more about how to find it, read [this](https://github.com/electron/electron/blob/master/docs/api/app.md#appgetpathname).

Related code looks like this:

```
const dir = app.getPath('userData')
const settingsFile = `${dir}/config.json`
```

Then change `useIdeasFromSettings: false,` to `useIdeasFromSettings: true,` and edit `breakIdeas` and `microbreakIdeas`.
