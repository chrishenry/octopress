---
layout: post
title: "A Note on Amazon Autoscale Groups"
date: 2015-08-26 22:04
comments: true
categories:
 - operations
---

AWS provides auto scaling to allow applications to scale up and
down to meet demand. Autoscaling is an excellent tactic for ensuring that an
application can add and remove capacity based on demand. Autoscale policies
can be infinitely tuned to use anything that can be recorded by CloudWatch.

However, autoscale groups are also incredibly useful for ensuring that a set
number of instances is always available. This is accomplished by omitting
scaling policies.

But for some reason, AWS users seem to shy away from using Auto Scale Groups for
anything but satisfying elastic demand. However, in my experience, autoscale
groups are a critical component of _any_ highly available deployment. Even
deployments of single instances.

The utility of a service that does nothing but ensure that the desired number of
instances available is the basis for creating self healing infrastructure.
However, the name `Auto Scaling` has created a widely held opinion that the
number of instances must regularly change to make use of autoscale groups.
This is simply not true.

For example, you may find a situation where you need to ensure high availability
for an application only built to run on a single server. Or you may have a
snowflake server, or an application where it's not worth having more than one
instance. Instead of creating a standalone instance, you can create an autoscale
group with min, max and desired set to 1. As long as proper automation is in
place, the autoscale group will ensure there's always a single instance
available.





