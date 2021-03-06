---
layout: post
title: "First Byte"
date: 2013-04-01 23:29
comments: true
categories: 
 - devops
 - apache
 - statsd
---

As we all may have some idea of at this point, performance on the web is one of the keys to success. However, finding actionable performance metrics can be a challenge. In the course of a web request, there's a lot of stuff that happens. I'll briefly explain it here in a couple run-on sentences. 

When you click on a link, your browser or client looks up the location of the server via DNS, and then sends off an HTTP request, then your poorly secured router passes it on to the demons that are your local ISP, who then fiendishly pass that same request up to a backbone, which then traverses continents, oceans or even hemispheres, finally arriving at the data center or poorly ventilated closet where the web servers for that particular site live. That web server reads in that request for your stuff (probably porn, you sicko), and begins whatever its process may be to assemble the initial HTML payload, which hopefully involves validating that the way you asked for said stuff is correct, and if it is, then connecting to a database to actually get that lovely stuff, receiving a response, and puts together an HTML page with that data on it, plus references (more on those later) to CSS and JS to format the data in a way that makes sense, and even make it look a little purty. After that exhausting operation, the web server will take the opposite route through the backbone to the succubus ISP, through your router to your computer to your browser. Once that happens, you technically only have the payload HTML, which by itself isn't a whole lot of fun, so then the browser will read aforementioned references to CSS and JS, and then make web requests for each of those files, which, btw, will follow the same process as the initial HTML payload went through, until you have all of the CSS and JS. Then you can finally improve your mind by thoughtfully reflecting on the highly intellectual prose you requested not too long ago.

<!-- more -->

The point of all those horribly structured sentences in the context of web performance is that a web request will often spend more time being passed around various routers than actually being processed on a web server. Therefore, the act of measuring an entire web request is a fool's errand, since you're only measuring lots of things that you as a web developer don't have any control over. In reference to my poorly written story, the only bit that you can actually change is the time when the web request is in the poorly ventilated closet, being parsed, processed, retrieved, and put together by the web server.

Therefore, one of the most important measurements to be recorded is the time it actually takes from when a request is received to when the server has started sending the complete result back to the client. Working on a standard LAMP (P being PHP) stack, there is no way that I'm aware of to do this out of the box. One way is to inject code into your app that will measure this, or to use a framework where this sort of functionality is built in. However, IMHO, that's not the best approach, as it's just more code that needs to be written, maintained, and could possibly explode in some strange way, affecting your users. 

The approach that I've taken to measuring response times on the server is to use a somewhat obscure Apache module called [mod_first_byte](https://code.google.com/p/mod-log-firstbyte/). It's surprisingly easy to install and run, and having run it for several weeks, I haven't seen any performance issues or other oddities. Here's a quick example of how to install it.


``` bash

# make a suitable folder to hold the source
install_dir=mod_firstbyte
mkdir $install_dir

# svn checkout the source into the install_dir
svn checkout http://mod-log-firstbyte.googlecode.com/svn/trunk/ $install_dir

# depending on your linux flavor, you'll need a different program to compile
if [ -f /etc/issue ]
  then
  distro='ubuntu'
  apache_apxs='apxs2'
  apache_conf='/etc/apache2/apache2.conf'
fi

if [ -f /etc/redhat-release ] 
  then
  distro='redhat'
  apache_apxs='apxs'
  apache_conf='/etc/httpd/httpd.conf'
fi


# Use the weird apache command to compile and install the apache mod
$apache_apxs -c     $install_dir/mod_log_firstbyte.c
$apache_apxs -i -a  $install_dir/mod_log_firstbyte.la

```

Now that you've complied the module into an so file, you'll need to add it to the apache conf. While you're in there, you'll also want to add the %F directive to your relevant LogFormat lines. Again, adjust for Linux flavor, and LogFormat preferences.

``` apache

LoadModule log_firstbyte_module /path/to/apache/modules/mod_log_firstbyte.so

LogFormat "%h %l %u %t \"%r\" %>s %b %F" common

```

For ease of parsing, I recommend putting the %F flag at the end. I've been using a simple php script that runs every few seconds to grep for the last couple lines that have URLs I'm interested in measuring, pulling the %F off the end of the line, and then sending the value off to [statsd](https://github.com/etsy/statsd/). Keep in mind that the value of %F is in microseconds, so dividing the value by 1000 to give a more reasonable number is helpful. 

My script looks a bit like this. What I'm attempting to do is exclude anything that seems like it's a flat file, and only include URLs that are generated by going through my application. YMMV, depending on what your application is and what you want to measure exactly.


``` php

$log_lines  = array();
$cmd        = "tail -n 50 /var/log/httpd/access_log | egrep -v \"css|js|gif|png|jpg|jpeg\";
$statsd_key = "first_byte";

exec( $cmd, $log_lines );

foreach ( $log_lines as $line ) {
  
  $line_items = explode( ' ', $line );

  $firstbyte = $line_items[ count($line_items) - 1 ];

  $firstbyte_ms = ceil( ( $firstybyte / 1000 ) );

  StatsD::timing( $statsd_key, $firstybyte_ms );

} // foreach log lines

```

And voilà, you now have some very revealing graphs that will tell you exactly your app is performing, completely separate of how the hellion ISPs have decided to perform that moment. My favorite thing about these graphs is that they are an unopinionated view of how the last changes you've made have affected your app.
