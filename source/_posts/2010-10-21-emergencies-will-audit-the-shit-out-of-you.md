---
layout: post
title: Emergencies will audit the shit out of you
categories:
- Best Practices
- Horror Stories
- Process
- Systems Administration
---
Things never go wrong at convenient times: Like when you're auditing the
latest, coolest version of your app, and looking for bugs. Things have a funny
way of working out fine **then**. However, soon as you look the other way, a
multitude of problems come out of the woodwork. It usually goes something like
this:

  
One server goes down, and the system that was supposed to fail silently starts
screaming. The application it was supporting goes down, because the proper
timeouts and error handling was never written. You can't fail over, because
failing over will take down 2 other applications. When that first server comes
back up, nothing works, because the proper startup scripts were never put in
place. Once the right services start, if you can remember what the hell they
were, you find the original application is configured wrong. Not only is it
configured wrong, it's **_always_** been configured wrong, and no one noticed.
No one noticed because it only explodes in the exact set of horrible
circumstances you have right now. Which is, by the way, being down.

  
It's an all-too-familiar story, and one that even most the anal of admins has
dealt with. The fact of the matter is that it is going to happen, and there's
not a whole lot you can do to prepare, other than randomly pulling plugs out
of servers. But with any mistake that causes downtime, it should [only happen
once](http://l.chr.ishenry.com/fail). Proper postmortem examination needs to
be taken here to figure out what went wrong where. Once all the variables are
understood, the next step is to duplicate the same set of circumstances in
your [sandbox](http://l.chr.ishenry.com/sbx), and apply the necessary error
handling.

  
Downtime and emergencies are a part of running any site. What's really
important is to treat emergencies as an opportunity to learn about what
happens when systems fail, for real.

