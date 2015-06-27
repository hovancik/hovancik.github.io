---
title: Squeeze to Wheezy to Jessie
date: 2015-04-15 17:53 UTC
tags: debian, linux, getles, lowendspirit
category: software developer
---

## Or Dah Boo Dah Hou

Not really much to say here: I have a [LowEndSpirit](http://LowEndSpirit.com) server to have [getles.tk](https:/getles.tk) sitting on it.   

And it had Debian Squeeze. So I upgraded it. To Wheezy.

### Boring. 

Well, in fact I was a bit scared, because dist-upgrade usually isn't something going too well, but after realizing that only thing there is nginx and some sec stuff, I went for it. 

So I edited sources list and `apt-get update && apt-get upgrade && apt-get dist-upgrade`. 

No troubles at all.  
Except: `libncurses5 libncursesw5` being kept back. They have some weird version:

```
libncurses5:  
  Installed: 5.7+20100313-5  
  Candidate: 5.9-10  
  Version table:  
     5.9-10 0  
        500 http://ftp.de.debian.org/debian/ wheezy/main i386 Packages  
 *** 5.7+20100313-5 0  
        100 /var/lib/dpkg/status  
```        

I guess should be safe to force their upgrade, I'll do it went I am bored and report back.  

**Or not.** 

### Update. 

Debian 8 aka Jessie was released. So I upgraded as well. As before, no problems.   

Very sweet.  


