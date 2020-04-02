---
title: BSDSec.net now runs on Heroku
date: 2015-04-05 05:59 UTC
tags: bsdsec
---

It's been some time, but I was lazy to write, so here comes the announcement:

## BSDSec.net now runs on Heroku

Why?

Well, until now I was using great service from Ninefold, but they decided to sunset their Rails App hosting service so I needed to look for an alternative.

I was using them because they had a free service (-50$ promotion), so sure thing I wanted something free as well.

*Short story long: I went with Heroku.*

## And it's good.

Because I did some stuff I was even more lazy to do than writing this article: writing code.  

Right, finally I made some refactoring and updated few gems. Especially when working with emails (now using bsdsec.net for mx, upgrade griddler to v 1 etc...).

And Heroku was as they say: Easy. All I needed to do was add gem, make some additional config to use puma and that's it. Plus I moved DB.
