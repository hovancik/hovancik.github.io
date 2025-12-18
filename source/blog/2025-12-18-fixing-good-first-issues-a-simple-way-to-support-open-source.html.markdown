---

title: "Fixing Good First Issues: A simple way to support Open Source"
date: 2025-12-18 13:40 +0000
tags: ai, open-source, good-first-issue

---

*Disclaimer: I work at Microsoft. The views in this article are my own and do not necessarily represent Microsoft.*


It's no secret that funding Open Source (OSS) projects is an issue that hasn't been solved yet. (I'll stop myself from linking memes illustrating the situation all too well.) Many individuals and companies try to help financially, but not everyone can donate, not everyone accepts donations (or can accept them), and there are a myriad of other things happening in between.  

As December is the time of year when many Open Source projects update their yearly funding goals and ask for contributions, I find myself thinking about this topic as well. Not only because I have a few OSS projects and accept donations, but also because I am a proponent and user of the OSS model. For example, in one of my projects, I say: "Stretchly is free, but you can support it by contributing code, translations, or money." And many people do. 

So, as I keep finding more and more value in all these agentic tools and workflows now available, an idea started to crystallize: **why not use the tools I get at work for free to help some OSS projects asking for help?**

That's what I started doing. If your employer allows it, **this can be an easy way to support the ecosystem, and I encourage you to consider doing the same**.

Here’s what I tried and how it went.

## Good First Issues

One of the most common ways maintainers signal that an issue is good for taking is by using labels like `good-first-issue` or `help-wanted`. I started by focusing on `good-first-issue`, since I wanted to look at Rust projects and I'm not a Rust expert. And yes, I'm talking about GitHub (and Copilot), since that's where my personal projects live and where I have an account and tools available.

I used this [GitHub search](https://github.com/search?q=label%3Agood-first-issue+language%3Arust&type=issues) to find `good-first-issue` labels on Rust projects, and I also asked VS Code Copilot to *help me find some interesting good-first-issues in Rust projects that it could help me fix, even though I'm not a pro in Rust*.

Here are the PRs I created with the help of agentic tooling, ranging from docs updates and code fixes to updating an older crate to a newer Rust edition: [nushell/nushell#17178](https://github.com/nushell/nushell/pull/17178), [serde-rs/json#1302](https://github.com/serde-rs/json/pull/1302), [dsprenkels/sss-rs#15](https://github.com/dsprenkels/sss-rs/pull/15).

Since these are new, I haven't heard back from the projects yet, but I already feel good about it. It reminds me the one of many reasons why I love OSS: it's made of [the thousands of tiny kindnesses](https://hovancik.net/blog/2019/10/15/some-of-the-joys-of-open-source-development/).















