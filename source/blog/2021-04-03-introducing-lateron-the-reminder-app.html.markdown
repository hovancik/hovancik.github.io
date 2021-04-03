---
title: Introducing LaterOn - The reminder app
date: 2021-04-03 08:10 UTC
tags: LaterOn
---

One of the much requested features for [Stretchly](/stretchly) is having custom reminders:

- let me have water reminder every `X` hours,
- remind me to stop working at `Y`,
- tell me to do `Z` at `W pm`,

and such.

While I agree that they are useful for that person (and probably would be for different people as well), that's not what I am trying to do with Stretchly. Stretchly is the break time reminder app: it reminds to take a break and it gives [science-based](/stretchly/research) ideas, but it's up to the users how they are gonna implement them.

Plus I don't want to complicate the code needlessly.

### But

When users asked me for such a feature, I always pointed out that there are apps that do the custom reminders. And that is so. *But* they do that in terms of `on specific day remind me to do X`. That's not very good, as what people were asking for was more of `on specific times, every day or so, remind me to do Y`.

### Welcome, LaterOn!

Therefore I decided to hack-around an app that would do exactly that.

[LaterOn](https://lateron.app) lives in tray and then sends system notifications based on the scheduled reminders that user creates. Here's an example of the default notification that users get at the start of the app:

<img src='/img/lateron-default-notif.png' alt='Default LaterOn notification'/>   

As notifications go, user can specify a title and body of said notification.

<img src='/img/lateron-reminders.png' alt='LaterOn reminders management'/>  

Users can view their existing reminders from tray "Reminders" menu. Example notification is show, together with the next occurrences and the rule. It's then also possible to edit, remove and add new reminders.

[So yeah, go download it and give it a try!](https://lateron.app)

*(LaterOn is rather basic, right now, but works just fine for me :) )*
