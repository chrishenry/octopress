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

Different ways to pull in other ruby libraries when writing serverspec;

* Simply use ruby `include`
* Add a Gemfile to your serverspec folder
* Use Gem::DependencyInstaller in the spec_helper

Here's an example of installing the `inifile` gem in your `spec_helper.rb`.

``` ruby Install a gem in spec_helper
begin
  Gem::Specification.find_by_name('inifile')
rescue Gem::LoadError
  require 'rubygems/dependency_installer'
  Gem::DependencyInstaller.new(Gem::DependencyInstaller::DEFAULT_OPTIONS).install('inifile')
end
```
