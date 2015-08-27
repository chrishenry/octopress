---
layout: post
title: "A Note on Amazon Autoscale Groups"
date: 2015-08-26 22:04
comments: true
categories:
 - operations
---

Amazon Web Services provides Auto Scaling to allow applications to scale up and
down to meet existing demand. It is an excellent tactic for ensuring that an
application can increase capacity based on demand. Auto Scaling policies can be
infinitely tuned to use anything that can be recorded by CloudWatch.

However, Auto Scaling groups are also incredibly useful for ensuring that a set
number of instances is always available. This can be accomplished by simply
omitting any Scaling Policies.

For some reason, AWS users seem to shy away from using Auto Scale Groups for
anything but satisfying elastic demand. However, in my experience, Auto Scale
Groups are a critical component of any HA deployment. Even deployments of single
instances.

The utility of a service that does nothing but ensure that the desired number of
instances available is the basis of creating self healing infrastructure.
However, the name `Auto Scaling` has created a widely held opinion that the
number of instances must regularly change to make use of Auto Scaling Groups.
However, this is simply not true.

For example, you may find a situation where you need to ensure high availability
for an application only built to run on a single server. Or you may have a
snowflake server where it's not worth having more than one instance. Instead of
creating a standalone instance, you can create an Auto Scale Group with Min, Max
and Desired instance set to 1. As long as proper automation is in place, the
Auto Scale Group will ensure there's always a single instance available.



