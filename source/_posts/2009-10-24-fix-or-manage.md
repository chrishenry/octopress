---
layout: post
title: Fix or Manage?
categories:
- Best Practices
- Web Architecture
- Web Dev Teams
---
Sometimes bugs come along that require significant work to fix. Depending on
what project timelines are like at the moment, sometimes fixing the bug isn't
the best option. For example, a race condition in the caching architecture
causes pages to be stale. The persistent data store is correct, but the cache
is not. To the person who just triggered the update, there's a bug. The
information on the public side is not in sync with the information they just
entered.

  
So, like any other bug, a report will eventually percolate down to the dev
team. People scream, fortunes are lost, the svn blame command is used, and the
devs who wrote the code pee their pants. Once the chaos dies down, the actual
prognosis of this issue can turn out to be extremely grim.

  
A shortcoming of the caching architecture shows that there's a race condition
when the system is under heavy load. In order to fix it, the dev team needs to
plumb the depths of the data access layer, and probably change some
parameters. But that'll probably break everything. Everywhere. Or the layer
manipulating the data could be fixed to replace the cache instead of
invalidating. Except the methods to manipulate that entity live in 3 different
codebases. It'll probably break the editor. Either way, the actual solution
doesn't matter.The dev team certainly needs to do something, and it needs to
be released three days ago.

  
The correct way to fix this issue will vary widely depending on circumstances.
But in this particular case, the best answer was to **not fix it, just manage
it**. Our team was busy, there were other projects that were more pressing.
Plus the codebase was being rewritten. So instead of flogging a dead horse, a
simple script was thrown together that compared the cache and the database. If
they were out of sync, the cache would be cleared, and would be repopulated
with the correct information the next time it was requested. Once it was
implemented, the bug was still there, but the cache _seemed_ to be up to date.

  
Every dev team will face bugs that have enormous costs to fix. The way to deal
with these bugs will be different every time they come up. It's important to
remember that managing bugs can be almost as effective as fixing them.

