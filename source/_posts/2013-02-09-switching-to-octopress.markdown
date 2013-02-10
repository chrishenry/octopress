---
layout: post
title: "Switching to Octopress"
date: 2013-02-09 16:08
comments: true
categories: [blog, tumblr, wordpress, octopress]
---

Last month, I decided to refresh my blogging platform. My Wordpress was old and busted, and working on it didn't quite fit with the way I wanted to work. I tried tumblr for a few weeks, but it felt pretty constraining. Overall, I was looking for a platform that gave me control, and the ability to crack open the source and do what I wanted.

<!-- more -->

Overall, here were the features I was looking for

  - Display code beautifully, right off the bat.
  - Add plugins. Maybe even write them myself.
  - Be able to have all my content organized how I want.

[Octopress](http://octopress.org) was a perfect fit. Working with git, the command line, and markdown are all things that are very familiar to me. There's a great community around it, and enough open development around it to support most of the things I want to do. And if the community hasn't built it yet, then I can certainly give it a try myself. 

The docs on the [Octopress](http://octopress.org/docs/setup/) site are really good. Aside from the typical challenges of upgrading Ruby on Mac. [MacPorts](http://www.macports.org/) was extremely helpful with the upgrade to Ruby 1.9.3.  Also, the provisioning of a Heroku dyno, and the deploy was as close to painless as it gets.

The migration, however, was not quite as simple. I had plenty of trouble getting my content into tumblr, and I also had a bit of trouble getting it out. Tom Preston-Warner's [github wiki](https://github.com/mojombo/jekyll/wiki/blog-migrations) was very helpful. However, be aware that the default ruby gems are a little out of date, and the information [this resolved issue](https://github.com/mojombo/jekyll/issues/773) helped get around the trouble.

Once the posts were actually imported, there still needed to be a bit of massaging done to get them into shape. The yaml header was using tags instead of categories. In the source/_posts folder, a quick sed command got me what I wanted.

{% codeblock Sed snippet lang:bash %}
  $ sed -i '' 's/^tags/categories/' *
{% endcodeblock %}

I do miss my old Wordpress blog, but it was definitely time for a change, as that had been my blog for years. Setting up Octopress has been a great experiment in looking at another language (ruby, and some python), getting more familiar with git, and getting even more acquainted with SublimeText.
