---
layout: post
title: Run cron more than once a minute
categories:
- Systems Administration
---
As far as linux utilities go, cron is one of my favorite tools. It handles
batch jobs, checks your database, cleans up files, whatever you need to do on
a regular basis. One of my favorite uses for it has been to keep a watchful
eye on MySQL for runaway queries.

  

![The lowly crontab file](http://174.143.169.75/wp-
content/uploads/2009/02/picture-2.png)

  
One of the problems with managing a website that has outgrown its database
design is that as traffic piles up and tables grow, so does the length of time
it takes to run queries. Even the simplest query, when faced with examining
several million rows can wind up locking a table for a scary amount of time.
The real solution is to rewrite your app to not suck. However, when that
luxury (neccessity?) isn't available, the next best thing is periodically run
a script that will kill long running queries.

  
It is not the cleanest solution, or the safest, and care must be taken to
avoid killing queries that do important things. It would be a really, really
BAD THING if you wind up killing the query that logs that $500 transaction.
That said, in most situations running this script every minute should solve
all your woes. With decent error logging, it'll also tell you exactly what is
running away from you. But what happens when you need to run it more often?
Say every 30 seconds. And that's where cron falls on its face.

  
After exhaustively researching, I could not find a way to get cron to run a
job more than once a minute. (If any one knows differently, please say so…)
However, knowing that I needed to run this script more than once a minute, I
needed to find an alternative. That alternative turned out to be the humble,
rarely used sleep() command. Set up a second cron job, with the script doing
nothing sleeping for 30 seconds, and then calling the save mysql script.

  
Voila, cron that runs more often than a minute!

