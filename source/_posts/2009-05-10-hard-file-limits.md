---
layout: post
title: Hard File Limits
categories:
- Horror Stories
---
A while ago, we ran up against a hard file limit on our storage server. Within
the main images directory, we subdivide our folders for every user. Well, it
turns out that on the [ext3](http://en.wikipedia.org/wiki/Ext3) filesystem,
there is a hard limit of 32k folders within a folder. So when our 32001th user
signed up, they were welcomed by not being able to upload any content to their
nonexistent user folder.

  
So there we were…

  
Several calls to our hosting provider [Rackspace](http://www.rackspace.com)
yielded no elegant solution where we could simply reconfigure the limit. If we
wanted to continue on with our file structure the way it was, we would need to
migrate our data off the server, reformat the filesystem to
[xfs](http://en.wikipedia.org/wiki/Xfs), and migrate back on. That would take
us down for close to 36 hours. Needless to say that was not an option.

  
The other option was to quietly close registration, and start a mad dash to
implement programmatic partitioning. We created 5 folders next to our root
user content folder, numbered them 2-5, and assigned current users the
partition of 1. New users would be assigned a randomly generated number at
registration. Then we wrote a few quick utility methods to determine which
user belonged to which partition and began the quickest rewrite of file upload
system the world has ever seen.

  
Downtime : 0

  
In retrospect, someone (me) should have taken a scrutinizing look at the
characteristics of the filesystem that would be responsible for storing all of
our users' content.

  
Lesson learned, the hard way.

