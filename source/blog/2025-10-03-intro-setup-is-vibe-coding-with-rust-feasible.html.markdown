---

title: "Intro & Setup: Is Vibe coding with Rust feasible?"
date: 2025-10-03 13:11 +0000
tags: rust, vibe-coding

---

Vibe coding (providing intent + context and letting AI handling the implementation) is one of those trends that sparks mixed reactions—some see it as a refreshing shift, others as a distraction. I think it depends on what you are trying to achieve. And right now, I’d like to vibe-code a solution to a real problem I have (as I have not vibe-coded, yet). To make it interesting and fun, I’d like to test a hypothesis with it: *Rust should bring structure and safety to the otherwise fluid nature of Vibe coding*.

I don’t have much experience with Rust (I’ve seen some videos about it), but Rust’s strong safety guarantees, expressive type system, and helpful compiler should provide AI agents with the structure and feedback needed to reliably translate intent into implementation.

## Plan
The Plan is rather simple: I want AI Agent (GitHub Copilot Agent, specifically) to go through the process of building an app that solves a real problem I have - tracking and managing 1-on-1 meetings with a wide range of people at work – while making sure the code is not what we are used to hear about vibed code: equal to the *bad* code. 

That means letting Copilot do as much of the work as possible—from figuring out what the app should do, to writing the code and making sure it’s not a hot mess. 

I won’t be blindly taken to wherever Copilot would want to take me, but at the same time, I plan to ask a lot of questions like “What do you think we should do?”. 

Let’s start!

*(disclaimer: I work at MS on Rust-related topics)*
*(note: as you might see from commit times, I played with this some time ago. I believe I've used Sonnet 4.)*'

## Setup
As that's what I have easiest access to, I'm starting with bare Windows 11 DevBox, where I installed Git and VS Code Insiders. Though thinking back, I should let Copilot install Git. 

After logging into Copilot with my GitHub, I jumped straight into describing my experiment to Copilot and asked what it thinks. As expected, it was way too optimistic—ready to dive into code before we even agreed on what the app should do. I had to slow it down. From experience, I know it’s worth stuffing some context into Copilot default instructions first, so I made it do exactly that. Now, when I start a new chat, I don’t have to repeat myself.

Once that was done, I asked Copilot to commit the files. Local repo created, [commit](https://github.com/hovancik/oneone/commit/5f0375f166c9c94d897025f365bae9cbc61a0df5) made (by Copilot). But of course, the branch was `master` :( so I told it to rename it to `main`. 

As I then asked Copilot to push to GitHub, it gave me instructions to create a repo there. When I mentioned the official MCP server (hey friend, do this for me), it just shrugged (metaphorically), that it does not have access to the GitHub’s MCP. I expected Copilot to suggest installing the GitHub’s MCP server, but nope. So I told it to [update](https://github.com/hovancik/oneone/commit/22b6930a7e027eb80bf40bbbd9ea43e3d8a34129) the files so this situation with making me doing things doesn’t happen again.

Copilot then suggested installing npm package (@modelcontextprotocol/server-github). I didn’t check it—no Node installed anyway—and asked for alternatives. It had some ideas (cargo, winget, direct binaries) but didn’t know whether GitHub MCP was included there. I know one can install MCPs from VS Code, so I asked about it. Copilot didn’t know VS Code could do that and suggested installing some extension instead. So, I gave up and installed GitHub MCP from the Extensions sidebar (shame on me).

After that, and short discussion about naming the repo `oneone`, Copilot was able to set it up and push my commits. It told me that it will use `trunk` (GitHub's modern default) for the branch, but it kept `main` as we renamed `master` to previously.

![repo setup](/img/copilot-1.png)

## MVP Spec

As helpful as always, Copilot asked me how I think about 1-on-1 meetings, whether it’s about person, meeting itself, timing or something else. While this is rather clever approach (I am going to steal it), it asked this because it was trying to map my thinking to structures in Rust, which I did not like as it’s too early to start thinking about code. But one must love Copilot’s sense of humor.

![copilot's humor](/img/copilot-1.png)

Copilot then created a file we iterated over to catch what I want to solve for, or what the first version should have. I have to say that I enjoyed the process: I read what it produced, gave it feedback and stated my pain points. Copilot was a bit too verbose for me (I prefer short descriptions without fluff), but in the end I was happy with it. You can check it [here](https://github.com/hovancik/oneone/commit/c057888), and yes, I tried asking Copilot to give me link to the commit and it worked just fine. 

![getting link to commit](/img/copilot-3.png)

## That’s enough for one post

To end part one of this experiment, I had 2 questions prepared for Copilot:

-	Considering what we have so far, should we do anything before we move to thinking about how the app should work (i.e. command line or web app)?
-	Considering our conversations so far, should I edit instructions for you (or any other rules), so that you give me more of what I want or change how you interact with me?

For the first one, it took some time to make Copilot not think about technical side (as in structures, storage etc.), but in the end it had a good suggestion of adding a [Readme(https://github.com/hovancik/oneone/commit/1e63595)]. I ignored similar suggestions to add license file. I’ll hopefully remember to that later.

I was more interested in how it would handle the second question talking about our relationship. I won’t bother you with all details, but we had a good discussion that led to some updates in instructions. Copilot did some good self-reflection, but in the end, it was up to me to say what I think did not work so well. To [sum up](https://github.com/hovancik/oneone/commit/6e5fbaa), I need Copilot to be more collaborative, don’t accept everything I say blindly and don’t just try to code right away. 

But hey, you might want the exact opposite, and that’s fine.

## Learnings

Let’s end this with list of my personal learnings / tip’n’tricks / recommendations from what I did so far, in random order: 

-	Think about Copilot as a person, have a discussion, except mistakes
-	Be opiniated, don’t let it drive you too much
-	Create default instructions
-	Notice what you don’t like about Copilot’s behavior and update instructions accordingly
-	When working on more complex things, iterate over some sort of design file (where the thing is being described)

Next time I’ll let Copilot setup the Rust environment and discuss the next steps. 

