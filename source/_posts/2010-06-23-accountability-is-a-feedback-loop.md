---
layout: post
title: Accountability is a Feedback Loop
categories:
- Best Practices
- Process
---
[Accountability](http://wordnetweb.princeton.edu/perl/webwn?s=accountability)
is a word that's getting tossed around a lot lately. You hear people saying
things like:

  

> - That developer should be held accountable for the validation problems.

> - The tester should be accountable for not finding that bug.

> - BP needs to be accountable for destroying an ecosystem.

  
  
The term seems to be thrown around most often when parts of a system fail. BP
is part of a larger industry which that's regulated. The government agency
responsible for monitoring safety measures is responsible for ensuring they
follow safety regulations. So when BP made their [whoopsie
daisy](http://twitter.com/bpglobalpr/status/14583761878), the fingers were
pointed squarely at them. However, where were the regulators? There were tons
of opportunities for the government to push feedback to BP regarding the
safety of their operation. But it seemed like no one was talking.

  
The development process is strikingly similar. Any development team worth
their bits has a process that puts any issue in front of at least two parties
at all times. Joel Spolsky's infamous [Bug
1203](http://www.joelonsoftware.com/articles/fog0000000029.html), a quick
story about the interactions between a dev and a tester, is the picture of
accountability, and shows that without active management and constant feedback
being exchanged, **things don't get done**.

  
A quick synopsis and commentary: Jill the tester finds a bug, and provides
feedback to the dev team via the ticket system. In doing so, Jill has started
the feedback loop, and made it the responsibility of the dev team to
investigate the issue. The dev team, as they are prone to doing, deny
responsibility for the issue, and mark the issue as 'NOT A BUG' Having done
so, they've put the onus on Jill to prove it's _really_ a bug, which she does
(probably in about 2 seconds). It's again the responsibility of the dev team
to fix the bug, which they do. Jill confirms the fix, and thereby closes the
loop.

  
What's important to realize is that in this type of process, it is the
responsibility of anyone and everyone involved to be accountable for their
role, and be focused on pushing feedback to the next person. Once there's a
break in the loop, the issue is likely to be dropped, and never fixed. The
last person holding the ball is the screwup. I'm sure someone somewhere is
really upset they didn't ask BP about that little safety measure.

