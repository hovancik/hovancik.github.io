---
title: Mobile browsers, Let's Encrypt and Heroku
date: 2016-10-05 10:59 UTC
tags: heroku, letsencrypt, android, chrome
category: software developer
---

When you start working with SSL and Heroku, (and with Heroku in general), their dashboard
is pretty much self-explaining and easy:

 > Paste server certificate here, private cert there, change DNS and you are ready.

So what you do is go to where your cert files are and copy `cert.pem`  and then `privkey.pem`.

At least that's what I did, and I was wrong. Desktop browser were working fine, and accepting this setup, but *mobile Chrome wasn't trusting my site*.

As it turns out, the solution is very easy: one should use `fullchain.pem`, not `cert.pem`.

(fullchain.pem = server cert + intermediates)
