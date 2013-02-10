---
layout: post
title: "Switching to Octopress"
date: 2013-02-09 16:08
comments: true
categories: [blog, tumblr, wordpress]
---

Wordpress was old and busted, tumblr wouldn't even let me embed an iframe, it was time to switch, get some more control, and make a project out of it.

<!-- more -->


I do miss my old Wordpress blog, but it was definitely time to change, as that had been my blog layout for years. It was mostly an experiment for me to set up a Rackspace cloud server. 

{% codeblock [Push firstbyte data to statsd] [php:php] [url] [link text] %}

  foreach ( $log_lines as $line ) {
    
    $line_items = explode( ' ', $line );

    $firstybyte = $line_items[ count($line_items) - 1 ];

    $firstybyte_ms = ( $firstybyte / 1000 );

    // Graff that shit.
    // @todo: statsd key: server's hostname, URL segment, time.
    // @todo: probably want an array of URLs to graph specfically.
    // @todo: graph the superset.


    echo $firstybyte_ms . PHP_EOL;

  }

{% endcodeblock %}
