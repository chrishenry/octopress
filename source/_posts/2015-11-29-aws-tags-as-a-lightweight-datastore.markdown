---
layout: post
title: "AWS Tags as a Lightweight Datastore"
date: 2015-11-29 14:36
comments: true
categories: 
 - operations
---

One of the most common tasks in administering clusters of machines is running regular tasks on individual machines in a cluster. For example, Cassandra benefits greatly from running repairs on individual nodes to ensure data consistency. Operating manually, an ops team would maintain a document of when each machine has been, and look at that to determine which machine should be repaired next.

However, in a world where there could be hundreds of machines, this quickly becomes unscalable. Even with only a handful of machines, a team could spend a ton of energy and time simply remembering where the source of truth lives and how to decide which machine should be repaired next.

<!-- more -->

A team could write some code to pick a node and run the necessary commands. This is a bit better, but the requirement is that the command runs regularly on each node in the cluster. Without a central record to track which nodes have been repaired, there's no way to know when and where the last repair was run, and no way to accurately predict which node will be picked next.

Enter [AWS EC2 Tags](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html). While EC2 tagging has some restrictions, it's an ideal place to register small bits of metadata and completely replace our old school document. For our Cassandra example, it's easy enough to use the EC2 APIs to list all machines in an Autoscale Group, or by tag, and then apply some logic to pick a machine.

Here's some sample code that will look at the instances in an ASG, and pick one that either hasn't been repaired, or the node repaired the longest time ago.

{% codeblock lang:python Find least recently repaired node %}
#!/usr/bin/env python

import boto.ec2
import boto.ec2.autoscale

ec2 = boto.ec2.connect_to_region('us-east-1')
asg = boto.ec2.autoscale.connect_to_region('us-east-1')

group = asg.get_all_groups(names=["your-asg"])[0]

instance_ids = [i.instance_id for i in group.instances]
instances = ec2.get_only_instances(instance_ids)

# Find instances without a `last-repaired` tag
for instance in instances:
    if 'last-repaired' not in instance.tags.keys():
        print "Found an instance without last-repair tag"
        print instance
        exit()

# Sort instances by date asc, which is oldest first
sorted_instances = sorted(instances, key=lambda instance: instance.tags['last-repaired'])

print "Found oldest repair: " + sorted_instances[0].id
print sorted_instances[0].tags['last-repaired']
{% endcodeblock %}

The above snippet is based on the venerable [boto](http://boto.readthedocs.org/en/latest/) library. Using python for interfacing with AWS allows you to use a mature, well-tested library. You can even write tests against code that uses boto with a library of mocks called [moto](https://github.com/spulec/moto). In short, it looks for instances that haven't been operated on first. This is to cover the situation where you have a brand new cluster, or when the ASG group replaces nodes. Secondly, it sorts the instances by the date of the last repair ascending, which gives you the oldest node at the zeroth element of the list.

Taking this approach to managing infrastructure allows you create simple, testable code with very few dependencies. Had `last-repair` data been stored in a local database, it would require the team to create and maintain that database, as well as write and test additional code. The team is now free to spend that time on other things. Without needing to worry about the integrity of a persistent datastore, it also means that this script can reliably be run on a very ephemeral instance. In fact, it can be run from anywhere. Scheduled Jenkins jobs would be a good way to run this, but with the advent of [Scheduled Lamdbda tasks](http://docs.aws.amazon.com/lambda/latest/dg/getting-started-scheduled-events.html), an Ops team can cut down even further on dependencies required to perform maintenance tasks.  

