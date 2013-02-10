---
layout: post
title: It happens to everyone...
categories:
- Horror Stories
- Systems Administration
---
Through a combination of unhealthy fears, paranoid tendencies, and luck, I've
been able to avoid that unavoidable situation that every sysadmin fears:
completely nuking a system. Until last Tuesday, when I did something really,
really dumb. On the server that hosts
[http://chr.ishenry.com](http://chr.ishenry.com), I had noticed a script,
[svcrack.py](http://lmgtfy.com/?q=svcrack.py), running and consuming lots of
resources, and bandwidth, as I would later find out from my hosting bill.

  
Since I sure as hell wasn't running that, I could only assume that someone had
exploited my server and was using it to look for unsecured voip installations.
Initially, I assumed killing the scripts and changing some passwords would be
sufficient. However, checking in the server later, I found the same script
running. All this is fair enough, as I am on Wordpress, a few versions behind,
and there are enough folders with unhealthy permissions that I kind of
deserved it. So after a few days of trying to lock things down, I got a bit
desperate.

  
Since svcrack is a python script, there was a good chance the best way to
discourage my assailant would be to remove python. Great idea in theory, but
it seemed my execution was a bit poor. It turns out running 'yum remove
python' is a great way to destroy your entire system. yum runs on python,
which meant a reinstall would have to be done manually. Only problem, most of
the shell bultins stopped working as well. cp, mv, ls all resulted in a
'command not found' error. The best part of this situation: no backups. After
all the [hubbub about blogs and
backups](http://www.codinghorror.com/blog/2009/12/international-backup-
awareness-day.html) lately, it's kind of amazing I missed this rather
important detail.

  
I've always considered data loss the cardinal sin in development, web or
otherwise. However, I also never considered my personal site to be mission
critical, or worthy of taking the the time for backups. But as they say, you
never know what you have till it's gone. I was lucky enough that mysql and
apache were still running, and I was able to export everything, spin up a new
server, and import. Even with no data loss, this is certainly a lesson
learned. I am making a backup right now.

