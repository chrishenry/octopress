---
layout: post
title: "never blame the button pusher"
date: 2015-05-31 00:14
comments: true
categories:
 - operations
 - culture
---

While having drinks with a colleague, the topic of improving execution within an
organization came up. There had been some problems in the past few years, but
this was an organization trying to operate in an unfamiliar way, and it was
suggested that problems could've been avoided by having a conscientious
operator. At one point in the conversation, the following was said;

> The people who push the buttons that cause problems should be fired. Heads
> should roll.

<!-- more -->

I was a bit taken aback. In my short career, I've pushed a lot of buttons
that have caused __a lot__ of problems. What was said was certainly not a
personal condemnation, but a statement made in frustration. Frustration born out
of seeing `human error` turn up as the root cause of most incidents, and not
enough improvement.

## Two problems

The first is that the person pushing the button is probably just following a run
book. They might be brand new. The run book may have been given to them and
they were told not to deviate. That's the point of run books, after all, is to
allow ops teams to operate safely with proven procedures.

The second is that mistakes and accidents happen, no matter how much
preparation, automation and resiliency engineering goes into a service. [It is
inevitable that services will fail, and getting frustrated or angry about it is
irrational.](https://twitter.com/beerops/status/571096463398187008)

For both of these problems, it's extremely damaging to allow individuals to be
blamed for an incident. It destroys morale to see a team member singled out. A
rough lesson learned by one team member doesn't always translate to
institutional knowledge that helps prevent the next issues.

## The solution

What we need to look for are things that can written down, codified and repeated
to ensure the same problem is prevented. If a run book procedure turns out to be
incorrect in a given set of circumstances, then it needs to be reexamined, by
the entire team. If an automation does the wrong thing, it needs to be fixed. If
a system allows actions to be taken that damage the effectiveness of the
service, you need to ask why those actions are allowed.

The point is, there is almost always an aspect of the system that can be changed
to ensure problems are avoided. Focusing on that will be way more productive
than focusing on individual actions.
