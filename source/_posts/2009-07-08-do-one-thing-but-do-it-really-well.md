---
layout: post
title: Do one thing, but do it really well
categories:
- Development
- Web Architecture
---
In life there are people who will consider themselves Jacks of all Trades. But
as the saying goes, they are master of none.

  
Websites will always start out as a codebase that does everything. There will
be a couple files that add users, encode video to Flash, pull rss feeds,
assemble HTML, update products, charge users, manipulate images, redirect old
links, handle file uploads, calculate shipping, delete categories, create rss
feeds, search the database, etc. Sometimes the code to do these will be
organized into files, sometimes it won't. The whole site will run on a single
server, or more likely, a slice of a single server.

  
None of the things in the above list will be done well. None. This is mostly
because there is too little code and too little hardware focused on doing too
much. Also, every piece of code will be tightly coupled. So any one of those
features could potentially get a ton of traffic, or hit a bump, and consume a
ton of resources. Once that happens, it's safe to assume the whole thing will
go down in flames.

  
So to avoid the Fail Whale, its really important to build sites as a group of
components that work together. [Architecture](http://bit.ly/TunGR) is key, and
when carefully thought out, can ensure that the most important parts of the
site stay up. Even when your image manipulation script on the backend freaks
out, the home page should continue to load flawlessly.

  
With database-driven apps (almost every major site on the web), there needs to
be particular attention paid to a caching layer. Again, since most sites start
out with a jumbled codebase, the likelihood that all the code to manage data
is in the same place is unlikely. Given the complexities of managing cache
objects, making sure that objects are invalidated on update is crucial to
making updates look seamless. So there needs to be a set of code that's good
at one thing: managing data and its cache.

  
Search is another area that commonly relies on database, and can eat a ton of
resources. If performing search in SQL, difficult queries can lock tables and
keep other queries from being answered. As good as some DBMSes have gotten at
handling search ( ie MySQL's FULLTEXT ), they still can't fulfill the
concurrency demands of a site with heavy traffic. So, again, the solution is a
change where a resource intensice feature needs to be isolated from other
code. There are a few different ways to do this. One is running replication,
which may not be possible in smaller hosting environments. Another is to use
Full Text Search (Lucene, Sphinx, etc.) Again, this may not be possible in
smaller hosting environments.

  
Using code that's already good at managing and retrieving data, an interface
can be built to query your data. A second hosting environment that's suitable
for running the search tool of your choice can then query the data code for
updates it needs to keep itself updated. In turn, this server will return
search results without tying up any resources necessary for doing important
stuff, like serving the home page.

  
So in these two short examples, we've created a theoretical architecture that
can sustain heavy, site-breaking traffic to the search, and still continue to
serve the home page. Of course, until the Apache server becomes so inundated
with requests that it can't do anything. Then it's time to get that load
balancer in place…

