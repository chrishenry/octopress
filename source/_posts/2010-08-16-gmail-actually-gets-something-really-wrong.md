---
layout: post
title: Gmail actually gets something really wrong.
categories:
- Best Practices
- Horror Stories
---
I'm a huge fan of Gmail and Google Apps for
[many](http://chr.ishenry.com/2009/04/26/just-manage-it-for-me/) reasons. I
love the new redesign, and how they're finally promoting consistency across
their major webapps. It makes me feel like the web could _really_ be a viable
alternative alternative to desktop software. I can even deal with
[slowness](http://www.avc.com/a_vc/2010/06/gmail-performance-issues.html) in
Gmail, given the amount of work they need to do in order to keep your inbox
snappy. They need to index every message, which means parsing every message,
converting every attachment, and linking it the search architecture. In real
time. Not easy…

  
However, what I found today, was completely inexcusable: Gmail's clipping
"feature". This is definitely a feature that sounds a lot more like a bug than
a helpful tool.

  
[![Gmail Message clipping](/images/user/gmail_clipping.png)](/images/user/gmail_clipping.png)

  
  
  
  
  
What _should_ be here is a few more links, some mouse text that contains our
mailing address and unsubscribe links. What I did not show in this screenshot
is the capacity for destruction this feature has on HTML emails. When the
email is 'clipped', the HTML is broken at a random place, and not displayed.
If your message is clipped at an inopportune place, there goes your entire
HTML layout. In the best case, your HTML is simply truncated, leaving users
with only a piece of their email.

  
As the entity sending this email, the responsibility falls on me to make sure
that I send emails that are accessible, conform to CAN-SPAM, and are pleasing
to the eye. Gmail bones me on three of these goals. Thanks to a
[lack](http://mail.google.com/support/bin/answer.py?hl=en&answer=9377) of
[documentation](http://tinyurl.com/2asve9s) as to how long an email can be
without invoking the clipping feature. Most importantly, my users have no
clear to unsubscribe from the list, since the most likely links to be clipped
are the unsubscribe links.

  
I agree that
[performance](http://mail.google.com/support/bin/answer.py?hl=en&answer=9377)
is king, but never at the cost of the user.

  
**Update:** It seems like Gmail limits messages to around 102k characters before clipping. So the solution seems to be running HTML through a compressor. I found a pretty good one [here](http://www.textfixer.com/html/compress-html-compression.php)

