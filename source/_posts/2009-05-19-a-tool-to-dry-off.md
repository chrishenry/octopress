---
layout: post
title: A tool to DRY off
categories:
- Best Practices
- Tools
---
Every developer worth their bits knows that code repeated is a maintenance
problem waiting to happen. However, code written by a group of devs under
tight deadlines tends to get pretty ugly pretty quick, with lots of snippets
being copy/pasted because 'they work'. The allure of getting things up and
running quickly is a siren call that constantly lures us away from the all-
important refactoring and integration that makes code maintainable. But once
the dust has settled, and there is a spare moment to re-read and consider what
should be changed, the task of refactoring seems too daunting to even bother.

  
Thankfully, Sebastian Bergmann has created a tool that will find every dirty
little Ctrl-V. It's called the php [Copy Paste Detector](http://bit.ly/1C6nR),
and can be installed using pear. Or download the source from git.

  
What's really interesting is when you play with the number of tokens and
number of lines that constistutes a copy-paste. For my purposes, I used a
minimum of 5 lines. In quite a few cases, the copy/paste turned out to
declarations, or including the same style sheets and scripts on different
pages. But when it was php, it was abundantly clear what needed to be
refactored, and how.

