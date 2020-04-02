---
title: BSDHistory
date: 2015-07-25 10:49 UTC
tags: discoverbsd, bsdhistory
---

## Or few lines about hot it was done.

### Idea.
I was thinking about how to tweet more from my [DiscoverBSD](https://twitter.com/_DiscoverBSD) account.
Based on the name of that account, I came up with idea of the tweets about BSD History. People should like that. So I tried to write at least one fact a week.

After few days, my mind came with idea to publish them also on website. You know, that kind where one can see one sentence in the middle of screen, with big letters. And link to share it.  

So comes [#BSDHistory](https://BSDHistory.DiscoverBSD.com).

### How it works.
Code is on [GitHub](https://github.com/DiscoverBSD/BSDHistory). I have and organization account for DiscoverBSD, so I put it there.

Site itself is hosted on [github pages](https://pages.github.com). I use [CloudFlare](https://www.cloudflare.com/) for DNS.

I try to use only basic stuff, so it's written in HTML, CSS, JavaScript. Starting point is basic HTML5 template from [Bootstrap](http://getbootstrap.com/getting-started/). Fonts are from Google - [Philosopher](https://www.google.com/fonts/specimen/Philosopher).

Probably it doesn't make sense to go deep into what files I have, so let's just say the main ideas:   

* I wanna have one file with facts
* Fact should have text (twitte-sized) and link to the source
* With JS we are gonna read the file, pick random fact and show it
* People can refresh site and see different fact
* People can also add their own facts
* We can share current fact on Twitter

#### data.json

Here is how JSON data looks like.

```json

{
  "bsdhistory": [
    {
      "text": "#BSDHistory : #MirOS BSD started on 29. August 2002, combining OpenBSD (-current) and NetBSD (-current) at that time",
      "link":"https://www.mirbsd.org/history.htm"
    },
    {
      "text": "#BSDHistory : #ARM port of #NetBSD was added in NetBSD 1.2 (Oct 1996)",
      "link": "https://www.netbsd.org/releases/formal-1.2/"
    }
  ]
}
```

What I do next is picking a random fact and filling the data on page with data from it (text, link to source,twitter share). For twitter to work I need to `twitter_link = twitter_link.replace(/#/gi, "%23");`, so I get the hashtags right.  

#### contribute via github

I've created readme [here](https://github.com/DiscoverBSD/BSDHistory#contribute), so it should not be so hard to contribute if anyone would like to.

### Plans.

I will add some more stuff probably. Anyone is very welcome to come up with ideas. It would made me very happy.

Official DiscoverBSD announcement can be found [here](https://www.discoverbsd.com/2015/07/introducing-bsdhistory.html).
