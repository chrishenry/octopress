---
layout: post
title: Distributed Updates
categories:
- Best Practices
- Ops
- Process
---
Part of managing any large site involves writing scripts that will go through
your data, make changes, merge things, remove things, do type transformations,
etc. Most of the time, in PHP, iterating through rows or objects will do just
fine. However, when there are lots of rows or objects, you could be faced with
a script that takes hours or days to run. Depending on how often active the
is, you may need to restrict access to ensure that the data before and after
the transformation remains consistent. In other words, if someone tries to
make a change to the data before the transformation, and the new feature only
looks at data after the transformation, that user has just lost their changes.
That is Very Bad.


As sites get larger and problems like this loom, taking the site offline
becomes less and less of an option. This is what the business team calls a
luxury problem, and what the ops team refers to simply as a problem. One
option is to write a more efficient script. You can get pretty far by simply
ensuring you're reading from the fastest data source available, make good use
of cache, etc. ensure that the tables being read for the transformation are
properly indexed. All of these are great places to start. Additionally, making
sure that data is grabbed in chunks can give the database time to breathe.
There's nothing worse than getting stuck in MySQL's "sending data" phase
simply because it needs to read several thousand rows from disk. MySQL
configuration can also be your friend here. If using InnoDB, increasing the
insert buffer is a great way to speed up writes.*


However, as much as you can do to speed up a single transaction, the fact
remains that you have to execute each transformation serially, one after
another. Your bottleneck is the transformation itself. It will take (# of
transformations * # of objects to transform) to complete the job. No matter
how well tuned the database is, it will only be performing one operation at a
time, which means your database, which is more than capable of thousands of
parallel, is not being used well. So the next logical step is to change your
update script to distribute the update operations so a few can be run in parallel.


Rewriting the update script does require thinking about your update
differently, and will not work in every case. For example, if one is simply
moving a large amount of data from one table to another, and there is no
transformation, or the transformation can be accomplished via a builtin MySQL
function, use that. However, just be prepared to deal with locking issues, and
the source data potentially not being available while the transformation is
taking place. However, if your transformation is complicated, and requires
per-case logic, this is definitely a good route to take. The biggest
difference is how the code for the update is organized. The update script
needs to be separated out into code that will apply the transformation for
exactly one entity, and code that will manage which entities get transformed
and when. Ideally, the code for the transformation is idempotent, so failures
can be handled by simply resubmitting the entity / object to be transformed
again.


Accomplishing parallel processing in PHP can be kind of tricky. Php's
pcntl_exec function has always felt a bit finicky to me. Of course exec on its
own it blocking, so that's out. Additionally, neither of these solutions offer
any sort of baked-in communication between the process that submitted the job,
and the process carrying out the job. That leaves us with a queuing system.
Popular systems include: RabbitMQ and Gearman. Personally, I've made great use
of [Gearman](http://chr.ishenry.com/2009/07/25/gearman/). It's easy to
install, as is the PHP module.


To sum up, performing large data updates via a distributed system is the way
to go if you have complex requirements per transformation, and the option to
perform these processes in parallel.


*If using MySQL's MyISAM engine, this isn't necessarily true, as writes will block, and the database could become the bottleneck. However, since MySQL is continuing to push InnnDB, this is getting increasingly unlikely. So if your tables are all InnoDB, you're probably in good shape.

