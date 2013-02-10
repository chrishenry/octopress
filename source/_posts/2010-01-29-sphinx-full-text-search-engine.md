---
layout: post
title: Sphinx Full Text Search Engine
categories:
- Development
- Web Architecture
---
For a very long time, I was convinced that a FULLTEXT index in MySQL was the
best solution for all your searching needs. Then I realized that it was
horribly slow, and mixing with complex joins completely destroyed any chances
of using MySQL indexes in any way that would make sense or get decent results.
The solution to fast and scalable free text search on any website is, of
course, a Full Text search engine.

  
There are a few different ones out there. After a brief affair with Lucene, I
settled on Sphinx. Sphinx is easy to install, even on 64-bit machines, and is
architected in a way that makes a lot of sense for the web. The following
steps were performed on a Red Hat machine. Don't skip the mysql-dev install,
even if you already MySQL installed.

{% codeblock Sphinx installation lang:bash %}
yum install gcc-c++
yum install mysql-dev*
wget http://www.sphinxsearch.com/downloads/sphinx-0.9.9.tar.gz
tar xzvf sphinx-0.9.9.tar.gz
mkdir /usr/local/sphinx
./configure --prefix /usr/local/sphinx --with-mysql> ./make
make install
{% endcodeblock %}

  
Once installed, it's fairly simple to start playing with the packaged example
data and queries. The php APIs make integration easy, either to build a
service, or use locally as a substitute for MySQL. In fact, as long as the
index can be kept reasonably up to date, Sphinx is a better choice for
complicated sorts than MySQL.

