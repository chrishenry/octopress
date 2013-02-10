---
layout: post
title: MySQL Slave Delay and Maatkit
categories:
- MySQL
---
This post could alternately be titled: 'How to make developers hate you.'

  
A very common criticism of MySQL is that there is no support for delayed
replication. Delaying data flowing from master to slave can be very useful in
certain cases. For example, running a co-located slave for backups is still
susceptible to data problems that caused by a DELETE with no where or a
mistaken executed DROP. However, by running the slave anywhere from an hour to
a day behind, you have the opportunity to catch whatever problems caused and
have a good copy of your data ready to go.

  
In [sandbox environments](http://chr.ishenry.com/2010/02/22/sandboxes/), a
consistent slave delay is a great way to reproduce race conditions. In fact,
running slave delay gives you the opportunity to ensure that data will be out
of sync between the master and slave. When you can count on this part of the
environment, developers can test and write code against this condition. Of
course, in reality, working in this type of environment is reaally annoying,
but necessary.

  
Delayed MySQL replication can be accomplished by using a tool from the
[maatkit](http://www.maatkit.org/) library. Documentation for the tool can be
found at [[http://www.maatkit.org/doc/mk-slave-
delay.html](http://www.maatkit.org/doc/mk-slave-
delay.html)](http://www.maatkit.org/doc/mk-slave-delay.html). What's great
about this tool is that can be run as a daemon, so that it can be easily run
for an extended period of time, without have to do any serious management.

