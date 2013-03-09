---
published: false
layout: post
title: "AppArmor, Ubuntu and MySQL"
date: 2013-03-08 22:46
comments: true
categories: 
- ubuntu 
- mysql
---


The other night I was investigating your typically heinous utf8 issue. I was working on a local copy of Ubuntu 12.04 that contained the entire dev environment, except for data. So I export a copy of the relevant data as a CSV, pulled it down, and attempted to run a LOAD DATA INFILE. 

Sane enough right? This is something I've done a million times in a bunch of different kinds of environments. However, after the inevitable fat-fingering, the error is typically pretty clear. In this case, not so much.

<!-- more -->

The error here was;

> ERROR 29 (HY000): File '/home/technician/data.csv' not found (Errcode: 13) 

I've been known to have short term memory glitches, so exited mysql and double checked my path. Three times. After jumping in and out of the mysql shell, I figured there must have been some sort of issue with the placement or permissions of file. Perhaps mysql simply isn't allowed to read the file from there. So I moved it over to the /tmp folder. Ubuntu allows everyone to read from there. No dice. So I moved it back to someplace that made sense and chown'ed it to mysql:mysql still no dice. It was simply as if mysql couldn't see the file.

After quite a bit of googling, it turns out a program called AppArmor was blocking mysql's access to the filesystem. From the [AppArmor Wiki](https://help.ubuntu.com/12.04/serverguide/apparmor.html);

> AppArmor is a Linux Security Module implementation of name-based mandatory access controls. AppArmor confines individual programs to a set of listed files and posix 1003.1e draft capabilities.

As it turns out, I'm not the [only](https://bugs.launchpad.net/ubuntu/+source/mysql-dfsg-5.0/+bug/244406) [one](http://ubuntuforums.org/archive/index.php/t-822084.html) [who](http://stackoverflow.com/questions/2783313/how-can-i-get-around-mysql-errcode-13-with-select-into-outfile) had issues with this piece of software. Like any good piece of software fighting the good security fight, it gives [no quarter](http://en.wikipedia.org/wiki/No_quarter), intentionally obfuscating what the exact problem is. For Ubuntu, this is pretty strange behavior. Typically, difficult things are pretty easy in Ubuntu, which I have seen lead to performance and security issues.

After a bit more Googling, the solution was relatively simple. AppArmor operates by reading in profiles for each piece of software that it monitors.


> sudo aa-complain /usr/bin/mysql





