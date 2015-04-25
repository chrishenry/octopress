---
layout: post
title: "Using Rspec with Serverspec"
date: 2015-04-23 13:21
comments: true
categories:
 - chef
 - operations
---

Testing the outcome of infrastructure provisioning is an operator's bread and
butter.

Serverspec has become a huge part of ensuring that infrastructure that gets
provisioned via chef is actually in the desired state.

Using ruby's builtin libraries to parse and manipulate configuration files is a
quick and simple win. You're no longer bound by having to use overly
complex, brittle regexes to ensure files are created correctly.

Using builtin libs to parse configuration files provides a lightweight, implied
means of testing that configuration files are valid. It's a straightforward,
programmatic approach to getting values out of configuration files.
