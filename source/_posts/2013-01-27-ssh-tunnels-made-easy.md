---
layout: post
title: SSH tunnels made easy
categories:
- ssh
- tools
- security
---
One of the classic problems in administering databases is providing secure,
yet accessible tools for all those who need to run queries or examine
production data. Classically, phpMyAdmin has been a great tool for handling
MySQL for those who don't know the command line. However, as any sysadmin
worth his salt knows, it's an extremely insecure tool for a couple of reasons.

  * It requires php, and specific modules, which is just one more thing to install.
  * It requires apache.
  * Apache requires port 80 to be open.

All of these things are bad, since garden variety attackers and script kiddies
can potentially find your phpmyadmin installation. Since phpMyAdmin is open-
source, and freely available, there always likely to be security holes. One of
the best ways around this is to close phpMyAdmin off to the public via
firewall, and then use an SSH tunnel to pass traffic through another server.
The server hosting mysql and phpMyAdmin can safely stay hidden, with all ports
closed.

![Diagram, showing the flow of traffic between client and secure mysql server.
](/images/user/ssh_tunnel_diagram.gif)



Set up looks something like this (on a Mac, at least).

  1. Install [MacPorts](http://www.macports.org/install.php)

  2. Install Xcode command line dev tools.

> Open Xcode -> Preferences -> Downloads -> Command Line Tools

  3. Install [autossh](http://www.harding.motd.ca/autossh/) , which is a tool for opening an ssh connection, and making sure it stays open. I use MacPorts to install it. [http://www.macports.org/](http://www.macports.org/)

> $ sudo port install autossh

  4. Once that's installed, you can run something like this. (Make sure that the port is the port that you configured Apache to accept traffic on.)

> autossh -M 20002 -f -L 7422:your.db.served.biz.org:7422 your.jump.server.biz
"sleep 99999999999"

  5. From there, you can open phpMyAdmin at a URL like http://localhost:7422/phpMyAdmin. One very convenient way to wrap all this up is to use the automator app.

![Automator screenshot](/images/user/ssh_tunnel_auto.png)

