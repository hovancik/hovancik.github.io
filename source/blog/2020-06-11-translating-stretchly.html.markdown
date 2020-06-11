---
title: Translating Stretchly
date: 2020-06-11 07:41 UTC
tags: stretchly
---

#### So you wanna help to translate Stretchly? Awesome!

This guide assumes that you know your way around command line and a bit or two about NodeJS, git and Github.

But if you are willing to learn something, you might be just fine, I am adding some extra notes for you. I hang-out [here](https://gitter.im/stretchly/Lobby) so that I can help you.

### Prerequisites
- [Github](https://github.com) account
- [Git](https://git-scm.com/)

### 0. Download Stretchly
Go to [https://github.com/hovancik/stretchly](https://github.com/hovancik/stretchly) and click on Fork button in top right.

This will create a copy of Stretchly code in your account. Then find `Clone or Download` button in your copy and *copy* the url.

Clone Stretchly code from command line (with git available) - using the url you copied a second ago:  

`git clone https://github.com/YOURNAME/stretchly.git`

If you are translating current version, you're good. But if you are coming here from newsletter about translating for Stretchly 1.0, do this: (change the branch)

`git checkout redesign`

Or possibly other branch, based on what are you trying to do :)

### Prerequisites 2

- [Node.js](https://nodejs.org/en/) installed (version from `package.json` file in the code), similar to:

```
"engines": {
  "node": "12.8.1"
},
```
If you are on Windows and installer is asking whether you wanna install extra stuff, say yes, you will save yourself some time :)

### 1. Install dependencies
Change to directory where Stretchly is located (the one that you just `cloned` with git) and install deps:

`npm i`

### 2. Try running Stretchly

Now you should be able to start Stretchly from command line (don't forget to close running instance of Stretchly, if you have one):

`npm run dev` or `npm start`

### 3. Translate :)

Open the folder with code in your favorite text editor and you are good to go. Translations are located in folder `app/locales/` and are named by their language code, ie `sk.json` for Slovak.

Translations are in `json` format and I've tried to divide them by their location in the UI of Stretchly.

**When you make update in translation file, you will need to close Stretchly and run it again (`npm run dev`) to see new translation in Stretchly.**

We do all this complicated stuff so that we can check that translations make sense :)

### Tips and tricks
#### Plurals

Each language handles plurals differently, thus you might see things such as `translation`, `translation_plural` and `translation_0` or `translation_1`. Go ahead to [https://jsfiddle.net/sm9wgLze](https://jsfiddle.net/sm9wgLze), input your language code and you will see examples to help you translate correctly.

#### Contributor Preferences
If you wanna translate Contributor Preferences and you are not a Contributor, yet, open `main.js` and change the line `isContributor: false` to `isContributor: true`. Restart the app and you will be able to open Contributor Preferences from `Love Stretchly`.

#### Errors
If your translation is not working, try checking if your formatting is fine, for example with [https://jsoneditoronline.org/](https://jsoneditoronline.org/)  

### 4. Commit and PR

Once you're done with translations and everything looks fine, you can commit your code and create pull request.

If newbie, I would recommend using some GUI program, such as `Atom` editor.

What you need to do:
- commit the translation file
- push commit to your Github repo
- create a PR in my repo to correct branch from Github

**Once your code is accepted, you will have my never-ending thanks, and a forever access to Contributor Preferences :)**
