---
layout: post
title: Architecture will Save You
categories:
- Best Practices
- Scalability
---
There are two things that cause sites to go down:

  

  * Something breaks.
  * Too much traffic.
  
  
When things break, there's nothing to do but [failover, examine, and
fix](http://chr.ishenry.com/2009/05/25/crisis-mo/).

  
But when there's too much traffic, you're screwed. The reason you're getting
so much traffic is because you've done something to earn it. Your site has
made it on to Digg or Reddit or even TV. Failing over to a status page is
admitting that you haven't done your job. Staying up means that some people
will see the site, maybe, but after a stupidly long wait. And then you become
'that site' that was taken down by too much traffic.

  
So as a web architect, this is your absolute worst moment. Everything you've
done over the past months or years is falling down miserably in front of you,
and there isn't anything you can do at that moment that will make a meaningful
difference. Unless, of course, your architecture is set up so you can increase
capacity by just turning up more servers. Among software architects, this is
know as being able to [scale horizontally](http://bit.ly/14YkWx)

  
So when the site is being built, it's extremely important that every choice
you make supports scaling horizontally, with each layer able to be spread
across many servers. Storage, session handling, database, apache […] are all
different layers. They all need to be able to handle more capacity just by
adding additional services to whatever layer needs it.

  
Having the horizontal scalable quality is really difficult when trying to get
a site out quickly. architecture is something that will often get de-
prioritized because there is no immediate result. However, taking the extra
time to build an application that follows the horizontally scalable patterns
is extremely important. Without spending that extra time, you can easily be
wiped out by the [Digg effect](http://www.ndesign-studio.com/blog/updates/the-
digg-effect/).

  
The biggest takeaway is when thinking about how to build your application,
focus on making it scale horizontally. So when the moment comes when you get
on Digg, you can spin up some more servers, sit back, and have a drink.

