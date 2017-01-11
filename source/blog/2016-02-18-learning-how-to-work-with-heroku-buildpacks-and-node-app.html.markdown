---
title: Learning how to work with Heroku Buildpacks and Node app
date: 2016-02-18 19:51 UTC
tags: heroku, buildpack, node
category: software developer
---

Few days ago I started to work on new task: deployment of the front-end [Node](https://nodejs.org/en/) app to [Heroku](https://heroku.com/).

I am not familiar with it, so what could go wrong? No worries, I have colleagues with more experience, so let's call it *time to learn*.

### First things first.

I have some basic experience with Heroku and [Ruby](https://www.ruby-lang.org/en/), so I started with *getting-to-know* questions.

What kind of app it is? How does the current deployment works? Are there any assets? How much does Heroku likes Node? *What the fuck?*

### Answers.

```
var express = require('express');
```
Seems like it's an [Express](http://expressjs.com/) app. No experience with that, but I would say that it's something that wont complicate anything and I pretty much don't need to care about what framework are we having here. So let's move on.

I created app via Heroku dashboard and then added remote called `heroku`.  `git push heroku feature/heroku:master` and:

```
-----> Node.js app detected
-----> Creating runtime environment
.
.
.
-----> Discovering process types
       Procfile declares types     -> (none)
       Default types for buildpack -> web
-----> Launching...
```

But the app is not running. That would be too easy.

### Buildpacks
Going back to app files and searching for deploy brought me to `Gruntfile.js`. From their website I decided that [Grunt](http://gruntjs.com/) is kinda like doing Rake task in Rails world.  Googling Grunt and Heroku brought me [buildpacks](https://devcenter.heroku.com/articles/buildpacks).  Those are basically collections of scripts that prepare your code to run on your app's dyno. Nice thing is that you can fork the default ones that Heroku prepared and customize it for your app. Colleagues to help!

So I went with the first one containing word Grunt. Following the instructions[^1], I created grunt task called `heroku:production`[^2] as that's what will run when deploying app.

Deploy.

```
-----> Found Gruntfile, running grunt build task
Loading "Gruntfile.js" tasks...ERROR
>> Error: Cannot find module 'flat'
```

Where's flat? In `devDependencies`. Not really caring what it does, but at least now I know that Node makes difference between production and development dependencies and that they wont get installed on Heroku. But we know that we can fix that in buildpack, right?

### Forking.

First thing I've tried was copying all the dev deps to production. (By doing that I also found out that I need [bower](http://bower.io/) and [compass](http://compass-style.org/)). Buildpacks that I tried didn't work, so in the end I decided to combine partially working ones and fork it into new [one](https://github.com/6artisans/heroku-buildpack-nodejs-grunt-compass-bower). Then we can figure out how to install dev deps on Heroku.

To install bower I committed [this](https://github.com/6artisans/heroku-buildpack-nodejs-grunt-compass-bower/commit/ada3b2198e46a6b55e96df82cd68fffe957dcbf8). It seems that installing dev deps ain't that [hard](https://github.com/6artisans/heroku-buildpack-nodejs-grunt-compass-bower/commit/9ea92e7189f1064a579b8cd234c4f0cde8e64655), too.

### *Yay!* moment.

```
Done, without errors.
Total 26.5s
-----> Discovering process types
       Procfile declares types -> web
-----> Compressing... done, 70.1MB
-----> Launching...
       Released v20
```       

Trial-Error took *only* 20 deploys, mission completed.

Now I know more about buildpacks, node and Heroku, compass, Grunt, Bower and bash.

Let's not forget bash.  


[^1]: Sorry, I don't remember which one it was.

[^2]: Task was the same as was used previously when deploying on custom server (building assets etc.), except things related to installing software on server.
