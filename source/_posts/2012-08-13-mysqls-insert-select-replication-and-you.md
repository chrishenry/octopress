---
layout: post
title: MySQL's INSERT SELECT, Replication, and You
categories:
- Best Practices
- MySQL
- Ops
---
Whenever there are situations where data needs to be copied from table to
table, or SELECTing lots of rows to be inserted, the [INSERT
SELECT](http://dev.mysql.com/doc/refman/5.5/en/insert-select.html) is an
elegant solution. It reduces the number of queries sent to a MySQL server, and
makes for elegant code. Additionally, with INSERT SELECTs, all processing
happens on the MySQL side. The app doesn't have to deal with having any of the
data in memory. This means that application servers can be run with less
memory.

  
Unfortunately, INSERT SELECT's best use cases coincide with cases where the
SELECT query has the potential to run a long time. On standalone servers
running InnoDB, this can be fine, as reads and writes will continue to execute
concurrently. However, if you're running MyISAM, queries will lock, and
nothing will execute. Instead, queries will queue up, your application will
come to a dead halt, MySQL will likely hit max_connections and Very Bad Things
will happen.

  
In [replicated](http://dev.mysql.com/doc/refman/5.5/en/replication-
implementation.html) environments, even well tuned ones running on InnoDB, a
long running INSERT SELECT can cause other sorts of problem. MySQL replication
is statement based. In other words, every statement that writes to disk on the
master is written to a log. The log is then transferred to slave(s), and those
statements are replayed on the slaves.

  
With INSERT SELECTS, every slave needs to run the same SELECT. The master will
not simply pass on the results of the SELECT, but rather simply pass the same
query to be executed by the slave(s). So in a replicated environment, it's
even more important to keep an eye on how long those INSERT SELECTS are
running. Not only is it a waste of processing power to run the SELECT portion
of the query across the entire cluster, the SELECT will actually block other
statements in the log from executing. This means that the data on the slaves
will become out of sync with the master, a condition called slave lag.

  
INSERT SELECT is a great tool, but beware of the costs of using it in certain
situations.

