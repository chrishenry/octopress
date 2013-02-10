---
layout: post
title: MySQL skip-name-resolve
categories:
- Best Practices
- MySQL
---
Small, obscure optimizations sometimes have the potential to make the greatest
impact. For example, every time a connection is made, MySQL will do a
[DNS](http://l.chr.ishenry.com/mbukt) lookup of the host that is trying to
connect. If MySQL is handling many connections, the overhead of an extra DNS
lookup can be hefty, simply because of the number of extra operations that
have to be performed before MySQL can actually start doing actual _work_.

  
Thankfully, there is an option in recent versions (4.1+) of MySQL that will
instruct MySQL to skip the extra DNS lookup. It's a fairly obscure option
called [skip-name-resolve](http://l.chr.ishenry.com/elgrt). The only caveat to
using this option is that the users defined the GRANT tables can only use IP
addresses as hostnames. For most MySQL users, this shouldn't be an issue.

