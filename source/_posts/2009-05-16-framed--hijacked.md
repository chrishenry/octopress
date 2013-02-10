---
layout: post
title: Framed / Hijacked
categories:
- Security
---
"There's lots of bad stuff out there on the Internet." -- anonymous
[Rackspace](http://www.Rackspace.com) tech

  
And bad people, too. On one occasion, I found that someone had hijacked a
domain similar to ours, and framed our site. Once they had the frame set up,
they started sending out spam from the hijacked domain. The legitimacy they
gained from having our site at their domain was really, really scary. Users
clicking links from their spam were sent to a site that was actually ours.
Luckily, we were alerted to this issue before any real damage was done.

  
There wasn't much I could do server-side to fight this, without having to dig
into a bunch of PHP. However, checking the location window.top against what I
knew to be my domain turned out to be decent defense.

  
if (top.location != self.location) { alert("someone is doing something
bad…");}

  
Of course, this particular defense will also complain about anyone who has
framed your site for any other reason. For example, the Digg toolbar frames
sites. So if anyone hits your site using the Digg toolbar, they'll be treated
to your warning as well. But whether Digg should be framing sites in this way
seems to be [controversial](http://bit.ly/15snr9) enough.

  
Update : [su.pr](http://su.pr), which combines a URL shortener with the
StumbleUpon toolbar, has even further complicated the framing situation. (Full
disclosure : I am a user.) Clicking any su.pr link will open the shortened URL
with the StumbleUpon toolbar. This has great potential for authors, who can
use the toolbar to increase traffic to their site, but at the cost of forcing
the toolbar on users.

