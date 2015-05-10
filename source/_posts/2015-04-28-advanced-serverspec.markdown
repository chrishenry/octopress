---
layout: post
title: "Advanced Serverspec"
date: 2015-04-23 13:21
comments: true
categories:
 - chef
 - operations
---

Testing the outcome of infrastructure provisioning is an operator's bread and
butter. Good cookbook tests create predictable automation, and can be added to
once problems are inevitably discovered. Serverspec is a huge part of ensuring
that infrastructure being provisioned via chef is actually in the desired
state.

Combining ruby's builtin libraries to parse and manipulate configuration files
with serverspec is a quick and simple win. We're no longer bound by having to
use overly complex, brittle regexes to ensure files are created correctly.

Parsing config files with similar libs that would be consuming them in
production provides a lightweight, implied method of testing that those files
are valid. It's also a straightforward, programmatic approach to getting values
out of configuration files. And not just scalar values, but lists and arrays.

Here's a few ways to pull in rubygems when writing serverspec;

* Simply use ruby `include`
* Add a Gemfile to your serverspec folder
* Use Gem::DependencyInstaller in the spec_helper.rb

Here's an example of installing the `inifile` gem in your `spec_helper.rb`.

``` ruby Install a gem in spec_helper.rb
begin
  Gem::Specification.find_by_name('inifile')
rescue Gem::LoadError
  require 'rubygems/dependency_installer'
  Gem::DependencyInstaller.new(Gem::DependencyInstaller::DEFAULT_OPTIONS).install('inifile')
end
```

Here's a few examples of using the gems we installed to make our tests better.

```ruby Parse an ini file
require 'inifile'

describe 'conf file tests'
  program_conf = '/my/path/to/important/program.conf'

  it 'writes out a program.conf file' do
    expect(file program_conf).to be_file
  end

  # Regex test
  it 'has the correct maxmemory value' do
    expect(file(program_conf).content).to match/^program\.java\.maxmemory.*=.*512.*$/
  end

  # Lib test
  program_ini = IniFile.load(program_conf)
  it 'has the correct maxmemory value' do
    expect(program_ini['global']['program.java.maxmemory']).to eq(512)
  end
end
```
