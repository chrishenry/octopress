---
layout: post
title: Just manage it for me
categories:
- Best Practices
- Systems Administration
---
I'm busy. Really busy. So busy that most of the time, I can't be bothered with
minor details that are so important they really shouldn't be minor.

  
Hardware upgrades, hardware failures, Kernel updates, Red Hat updates, PHP
updates, MySQL updates, who actually has the expertise to make judgments on
every single one of these? I certainly do not. However, at this point, I'm
managing over 15 servers, and I need to be up to date and secure. So that's
why we host at [Rackspace](http://www.rackspace.com/index.php). They do it all
for me.

  
Then there's mail.  Spam, ISP's blacklists, whitelists, bounce management,
mailbombs, DKIM, DomainKeys, SPF, WTF.  The world of SMTP messages is one of
black magic and voodoo.  Hosting your own email offers infinite flexibility,
and working with a single server with postfix lets you do pretty much whatever
you want.  But every time you do something nifty, you have to deal with the
ongoing maintenance of said nifty hack.  Then there's spam.  Good luck.
Instead of fighting the good fight against spammers, I decided to wimp out and
let someone smarter do it for me.  In 20 minutes, I set up [Google
Apps](http://www.google.com/apps%20), imported every user in my postfix
server.  5 minutes later, after changing DNS, I gave my users a spam-free,
flexible mail system.

  
Moral of these stories…don't be too proud to let someone else manage your IT.
Free up your time to do important things.

