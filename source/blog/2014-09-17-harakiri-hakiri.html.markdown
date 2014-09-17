---
title: Harakiri hakiri
date: 2014-09-17 09:19 UTC
tags: rails, hakiri, middleman
category: software developer
---

<img title="Harakiri" alt="Harakiri" src="/img/harakiri.jpg" />
[*](https://www.flickr.com/photos/home_of_chaos/12308619984/in/photolist-jKETTW-2mbBcT-2mfYQ7-2mbDUD-2mfWK3-2mfZsE-2mfY7o-2mfYuG-2mbD42-2mfXtW-2mfXF5-cYzxJ-jJ9y41-jJaf5A-7CV5D4-cm7RZ-dpbbT7-2mbDWP-cm7Q8-7fPYxN-4G7vtB-S67eF-4rpnbj-28zgKv-28DM8u-28DQS3-28zcRZ-7MpAwG-mDfmD8-92kBym-ow7heX-CMMyD-36wMpj)
##Or getting to know your secure side.

And insecure in that matter, as well, because let's be honest:

###We all do vulnerable apps.

Would be dangerous to think opposite. 

I use Ruby, and gosh, I don't even know how many [security risks](https://www.ruby-lang.org/en/security/) there are. And one more gem added means few more potential vulnerablities. I haven't been thinking about it all, until now.
Sure, I secure my VPS, read some articles about how to make [secure apps](http://guides.rubyonrails.org/security.html), etc, etc. I guess we all do, but...

###But what happens a year later?

Our app is thriving, we rather don't need that much updates of our code, but how secure we are? 

Oh well, we might not check, and in case nothing happend, then, well, then nothing happend. 

But that's rather rare. Once your userbase gets bigger, you will become more interesting for *bad guys* . 
There will always be someone looking for vulnarable products to take control of. Or some personal websites because *why not*.

###Straight to the point.

Today I found interesting tool: [Hakiri](https://hakiri.io). From what I wrote a bit more up, you probably can say what it does.

> What’s Hakiri? Hakiri is a web app that checks your Ruby stacks and code for new vulnerabilities. When a new vulnerability is detected, you get notified via email. Simple and clean.

They have free plans, so go see yourself. I don't feel like writing more, anyway. I need to update my Rails to get rid of 2 critical security warnings.