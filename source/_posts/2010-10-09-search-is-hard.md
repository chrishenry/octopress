---
layout: post
title: Search is Hard
categories:
- Horror Stories
- Tools
- Web Architecture
---
The title of this post is a direct quote from a Facebook engineer presenting
at the SXSW panel [Beyond Lamp](http://my.sxsw.com/events/event/386). Search
is a critical function of any site, but its gotten much much harder as Google
has gotten better. To quote the Beyond Lamp panel one more time:

  

> Search is always compared against Google, which is like comparing the canoe
you just built to the QE2.

  
  
The difficulty of search is made apparent by the majority of sites, even major
sites get it wrong. A large factor in the success of search is relevancy.
Google takes into account [500 million
variables](http://en.wikipedia.org/wiki/PageRank) in determining how relevant
content is. Not only that, but they also know who you are, what you've
clicked, and can make decisions based on that to present pages that are more
relevant to you. Facebook's EdgeRank, LinkedIn's Signal are other examples of
search implementations that are vast in scale.

  
In a startup, where time is of the essence and resources need to be begged,
borrowed or stolen, search is a huge challenge. Like trying to be build the
QE2 with nothing but a swiss army knife. Basic tools normally don't cut it.
MySQL's FULLTEXT indexes are helpful, but start trying to implement basic IR
techniques like booleans, and MySQL's builtin functionality starts to lack the
ability to get the results your want.

  
There are ways to simplify building search.
[Sphinx](http://chr.ishenry.com/2010/01/28/sphinx-full-text-search-engine/)
provides great matching capabilities and incredibly fast sorting. When
combined with other data, Sphinx can be a great way to get users fast,
meaningful results. The one downside with using a document based search engine
is that there is little room for returning completely tailored results. Unlike
MySQL, which allows you to slice and dice data in any way you choose, it is
more difficult to return results that take into account relationship specific
to users and documents. However, for most search tasks, it should function
very well.

