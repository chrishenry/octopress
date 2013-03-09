---
layout: post
title: "AppArmor, Ubuntu and MySQL"
date: 2013-03-08 22:46
comments: true
categories: 
- ubuntu 
- MySQL
---


The other night I was investigating a rather heinous utf8 issue. I was working on a local copy of Ubuntu 12.04 that contained the entire dev environment, except for data. So I exported a copy of the relevant data as a CSV, pulled it down, and attempted to run a `LOAD DATA INFILE`. Sane enough right? This is something I've done a million times in a bunch of different environments. However, in the vast, vast majority of cases, the error is typically pretty clear. In this case, not so much.

<!-- more -->

The error here was;

> ERROR 29 (HY000): File '/home/technician/data.csv' not found (Errcode: 13) 

I've been known to have short term memory glitches, so I exited mysql and double checked my path. Three times. After jumping in and out of the mysql shell, I figured there must have been some sort of issue with the placement or permissions of file. Perhaps mysql simply isn't allowed to read the file from there. So I moved it over to the /tmp folder. Ubuntu allows everyone to read from there. No dice. So I moved it back to someplace that made sense and chown'ed it to mysql:mysql still no dice. It was simply as if mysql couldn't see the file.

After quite a bit of googling, it turns out a program called AppArmor was blocking mysql's access to the filesystem. From the [AppArmor Wiki](https://help.ubuntu.com/12.04/serverguide/apparmor.html);

> AppArmor is a Linux Security Module implementation of name-based mandatory access controls. AppArmor confines individual programs to a set of listed files and posix 1003.1e draft capabilities.

As it turns out, I'm not the [only](https://bugs.launchpad.net/ubuntu/+source/mysql-dfsg-5.0/+bug/244406) [one](http://ubuntuforums.org/archive/index.php/t-822084.html) [who](http://stackoverflow.com/questions/2783313/how-can-i-get-around-mysql-errcode-13-with-select-into-outfile) had issues with this piece of software. Like any good piece of software fighting the good security fight, it gives [no quarter](http://en.wikipedia.org/wiki/No_quarter), intentionally obfuscating the exact error. For Ubuntu, this is pretty strange behavior. Typically, things in Ubuntu just work, and there aren't too many gotchas.

After a bit more Googling, the solution was relatively simple. AppArmor operates by reading in profiles for each piece of software that it monitors. Those profiles have two modes of execution, [per the docs](https://help.ubuntu.com/8.04/serverguide/apparmor.html). 

> - Complaining/Learning: profile violations are permitted and logged. Useful for testing and developing new profiles.
> - Enforced/Confined: enforces profile policy as well as logging the violation.

So the only thing we actually have to do to get mysql back in a place where it's working as expected is to run the following.

> $ sudo aa-complain /usr/bin/mysql

It's great that Ubuntu has enabled this by default, and taken a great step in being secure. However, it feels too heavy handed. 

Hope this helps someone!