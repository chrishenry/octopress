---
layout: post
title: Sandboxes
categories:
- Best Practices
- Systems Administration
---
Setting up a sandbox environment has normally been a trivial task. Set up a
vhost, get a copy of the database, build out the app, and start doing stuff.
When 'Stuff' is 'Done' push the changes onto production, and bask in your own
crapulence. That is, until your data set exceeds the limits of the sandbox,
and the [SOA](http://l.chr.ishenry.com/bbhcu) which is saving the day in
production is becoming nothing but a headache in development.

  
The basic sandbox environment for an app includes a reasonably recent data
set, similar ( underpowered can be OK, depending ) hardware, the exact same
versions of php, mysql and apache. Php, mysql and apache need to be configured
exactly the same way as in production. In fact, as part of this process, it
might be useful to pull down those ever so important configuration files, put
them in a safe place. Perhaps source control (cough). Consistent configuration
is **_extremely_** important. Bugs produced by configuration problems are
notoriously hard to reproduce, and result in devs combing through code looking
for bugs that don't exist.

  
Maintaining a few sandboxes should be a trivial endeavor. That is, until your
project gets too big. A natural response to handling ever-growing problems is
use a Service Oriented Architecture; that is, to shard off aspects of the app
and dedicate hardware and resources to it. However, three or four shards
later, multiplied by an environment for each developer, the guy who was doing
sys admin work as needed just became full timer. Unfortunately, there's no way
around this, even with a clever sys admin, who can leave enough automated
scripts around so that developers can *mostly* maintain their own environment.

  
The fact of the matter is maintaining the development environment is one of
the most important things a company can do. Close attention to detail in the
sandbox will make all the difference in the deployment process. Changes in
code base, file permissions and configuration can all be tested and deployed
the same as in production. So every build to every sandbox (everyone builds
daily, right?) is a chance for the development team to catch mistakes, and
learn from them, before the big push. And if that fails, we all know how to
handle a [crisis](http://chr.ishenry.com/2009/05/25/crisis-mo/).

