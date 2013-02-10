---
layout: post
title: MySQL and Linux swappiness
categories:
- MySQL
---
MySQL's InnoDB engine is really great. Row-level locking is amazing in tables
where there is heavy concurrency. Write buffering is also awesome for cases
where a table needs to accept a lot of data. InnoDB's use of memory to store
indexes or sometimes the entire table can also make reads incredibly fast,
especially on tables that need to support complex queries where even the best
placed indexes do nothing.

  
However, when tables get large, the innodb_buffer_pool is set to close to
amount of memory on the server, Linux has a tendency to remove your data from
memory for no good reason. The symptoms are unmistakable: a query that was
known to be pretty quick, but hasn't run in a while, will take long. Too long.
Run it again, and it becomes snappy. What's happening is that when the query
initially runs, the necessary data isn't in memory, so it's read in from disk,
and the query is performed. Once it's in memory, that second run is quick.

  
Actually there is a good reason Linux behaves like this:

  

> "My point is that decreasing the tendency of the kernel to swap stuff out is
wrong. You really don't want hundreds of megabytes of BloatyApp's untouched
memory floating about in the machine. Get it out on the disk, use the memory
for something useful."

  
  
- [[http://kerneltrap.org/node/3000](http://kerneltrap.org/node/3000)](http://kerneltrap.org/node/3000)  
  
This all makes sense, as most systems need to reclaim memory from applications
that aren't doing anything. Except in the case where you have a large dataset
in InnoDB that you'd really like to be in memory when you query it. Luckily,
there is a tunable that you can change to dictate how aggressive Linux is
reclaiming memory from applications. /proc/sys/vm/swappiness stores a number
for 0 to 100, where 100 means that Linux will be extremely aggressive in
reclaiming memory, and 0 means that memory won't be reclaimed all that much.

  
For servers that need to keep datasets in memory all the time, this variable
can be extremely helpful. With an InnoDB table / indexes that consume ~80% of
memory on the machine, a swappiness value of 30 is sufficient to allow MySQL
to keep most of that in memory. Of course, I don't recommend this for a
machine that is not 100% dedicated to a single task. However, on dedicated
MySQL machines, tuning this variable can be really helpful.

