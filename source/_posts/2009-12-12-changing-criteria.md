---
layout: post
title: Changing Criteria
categories:
- Best Practices
---
Occasionally, a project will come across my plate with the criteria, 'Make
sure this works everywhere, is completely template-able, and is something we
can grow with.' Normally this is coupled with 'We need this to work with X
*right now*, and Y and Z later.' What I really hear is 'Make it work for X,
and [ship ](http://bit.ly/6kpqUc) the damn thing.' After all, hitting those
deadlines is **really** important.

  
Of course, this has a whole bunch of ugly assumptions tied to it. The first
is: when I get to Y, everything I did for X will work. All I need to do is
drop in a few config changes, and tweak a few parameters, and I'm done. (Yea,
right) Secondly: that every case Y needs to cover is contained within X. (Not
Likely) Third: All of this will be so well documented that any literate
individual will be able to implement Y by osmosis.

  
So. Do we spend time now or later? Shipping X seems pretty simple, so why not
just build X, satisfy the business dude and call it a day. Spending time now
means that deadlines may have to shift, and something that should be simple
becomes complex. We have other, more important, projects to work on.

  
Eventually Y comes calling. So let me introduce you to…Future Web Dev Guy
Person Girl! If you're lucky, that person is you. If you're not, it's another
dev. The assumptions we made back in paragraph 2 have reared their ugly heads.
Since they were assumptions, you're probably boned. If not, you're probably
one of [these guys](http://www.ioinformatics.org/photo/images/p4.jpg). If
you're the rest of us, Future Web Dev Guy Person Girl definitely hates your
guts, because the groundwork that was supposed to be laid out is not there.
They're running through a lice-infested rat's nest of procedural functions
trying to pass the additional variable that will make this all work.

  
The best way to keep Future Web Dev Guy Person Girl from cursing like a sailor
is implement correctly, test thoroughly, and deal with Y before it's due.
Deadlines need to be managed according to project scope, and if project scope
includes Y, it needs to be accounted for now, before you lose a friend in
Future Web Dev Guy Person Girl.

