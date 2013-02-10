---
layout: post
title: Out of the Terminal
categories:
- Development
- Web Architecture
---
Every once and a while I get to leave server-land and get to do some fun
projects that involve doing something on the front end. The latest was
building an embed script for the Behance [Job
List](http://www.behance.net/joblist). Projects like this, that get me out of
the terminal and into a space that requires a bit more interaction between
domains, are particularly appealing. As much as I think the [Same Origin
Policy](http://en.wikipedia.org/wiki/Same_origin_policy) is reasonable rule
for security, I love looking at ways to get around it.

  
The technique I chose for this was
[JSONP](http://en.wikipedia.org/wiki/JSONP#JSONP), or JSON with Padding. I'm a
huge fan of JSON as a transport, as I feel it is compact, flexible and
stupidly simple to generate and consume. In fact, I've sworn to never touch
another XML file as long as I live. JSONP is really convenient from a API
implementation perspective, because when the request for the data is made (via
the script tag), all the client has to do is pass a callback and it can use
the data in any way it chooses. The server doesn't have to be aware of what
the callback actually does, although I do recommend checking against a list of
pre-approved callbacks, just to make sure.

  
Like any semi-decent developer, I have dog-fooded my own work, and implemented
the Behance Joblist embed code right [here.](/design-jobs/)

  
A little about the Behance Joblist:

> Top global companies find and hire talent on Behance, the world's leading
network for creative professionals.

