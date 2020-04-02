---
title: Editing tag reference on Github release
date: 2016-10-16 08:50 UTC
tags: github, tag, release, git
---

To release my [stretchly](/stretchly) app I use Github releases. And my workflow is similar to this:

- create feature branch and PR for that branch
- make draft release and upload executables there
- test executables
- merge PR
- publish release

Two last steps should be in sequence, as Github's release mechanism will use master as reference for the new tag it's about to create.

But today I somehow messed up and I released version before merging it first. (Nope, I don't have CI do this for me, yet.)

If you go ahead and try to edit the release, all Github let you do is edit tag name, description and so on, but not the tag reference. But as it turns out, and it always turns out that way, the fix is pretty simple with good old command line.

- `git fetch origin` to fetch tag from Github
- `git push origin :refs/tags/<tagname>` to delete the tag from github

Now your release is in draft stage again and you can edit the tag reference.
