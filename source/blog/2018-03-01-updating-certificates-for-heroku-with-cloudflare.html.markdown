---
title: Updating certificates for Heroku with Cloudflare
date: 2018-03-01 10:27 UTC
tags: heroku, certificates, cloudflare
---

Do you have a app on Heroku, DNS on Cloudflare and your SSL certificate is automatically managed by Heroku?

I do. And yesterday I received email like this:

```
Hi,

Automated Certificate Management
has failed for the following domains:

Domain 	              Reason
domain.sk 	
www.domain.sk 	

You should be able to find specific information
to correct the above noted errors at:
https://devcenter.heroku.com/articles/automated-certificate-management#troubleshooting

Happy coding,

Heroku
```

Yep, no reason, obviously.

Following the link gave me something useful (as my DNS records were fine):

*ACM is not available if your app is behind a CDN such as Cloudflare or Fastly.*

So I check my DNS again and I see that I use 'DNS and HTTP proxy (CDN)'.

Setting it do 'DNS only' and running `heroku certs:auto:refresh --app=myapp` did the trick.

My certificate is OK and I can set 'DNS and HTTP proxy (CDN)' again.
