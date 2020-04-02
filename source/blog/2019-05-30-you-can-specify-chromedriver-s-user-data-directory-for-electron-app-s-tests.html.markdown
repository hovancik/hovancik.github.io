---
title: You can specify chromeDriver's user data directory for electron app's tests
date: 2019-05-30 10:54 UTC
tags: electron, spectron, chromeDriver, tests
---

When upgrading [stretchly](https://hovancik.net/stretchly) to the version 5 of the [electron](https://electronjs.org/), I found myself fighting with failing tests testing the start of the app with specific settings. (Settings are saved as a file on disk, usually in user's data directory, and loaded on app's start.).

## Electron v2

[RGSoC](https://railsgirlssummerofcode.org/) students working on stretchly that time, wrote this code for the tests:

```
let Application = require('spectron').Application
let electronPath = require('electron')
const AppSettings = require('../app/utils/settings')

async function modifySettings (key, value) {
  let app

  try {
    app = new Application({
      path: electronPath,
      args: [
        `${__dirname}/../app`
      ]
    })

    await app.start()
  } catch (err) {
    console.log('error starting app:', err)
    throw err
  }

  try {
    app.client.addCommand('getUserDataPath', function () {
      return this.execute(function () {
        // spectron does not have the ability to "get path", so we
        // instruct spectron to get the contents of the electron module
        // and get the location of the settings file directory
        // (https://github.com/electron/spectron/issues/16)
        return require('electron').remote.app.getPath('userData')
      })
    })
  } catch (err) {
    console.log('error stubbing getUserDataPath command:', err)
    throw err
  }

  try {
    const path = await app.client.getUserDataPath()
    const settingsFile = `${path.value}/config.json`
    const settings = new AppSettings(settingsFile)
    settings.set(key, value)
  } catch (err) {
    console.log('error updating settings:', err)
    throw err
  }

  try {
    await app.stop()
  } catch (err) {
    console.log('error stopping application:', err)
    throw err
  }
}

module.exports = {
  modifySettings
}
```

What it does is running the app and then setting the settings we want. For example specific key/value before each test:

```
beforeEach(function () {
  return modifySettings('isFirstRun', false)
})
```

This was working fine (as I found out recently), because each test was running from the same location (or better said, the settings file was always in the same location).

## Electron v5

But this not what was happening in electron 5. Each start of the app had different user data path, thus when `modifySettings` set some value and I run the test, the path was different already. (As each was different start of the app.)

Fortunately, you can specify the location of user data directory, when creating new Application like this:

```
new Application({
  path: electronPath,
  args: [
    `${__dirname}/../app`
  ],
  chromeDriverArgs: [
    `--user-data-dir=${__dirname}/stretchly-test-tmp`
  ]
})
```

And that's exactly what I did.

When creating Application in `modifySettings` helper and inside of the tests, the same `user-data-dir` is specified, thus making tests pass again.

I guess it's not the best idea, as running each test from different directory makes sense, but for this use-case I'm fine with it.
