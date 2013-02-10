---
layout: post
title: Save MySQL
categories:
- MySQL
- Systems Administration
- Tools
---
Runaway queries on MySQL can be a real problem. If a long-running query locks
up important tables, other queries trying to query the table will will placed
in a queue. Each new query is a new connection to MySQL. Once you hit
max_connections, your MySQL connection code will start to fail. Depending on
how errors are handled at this stage of the request, this could mean total
disaster for a site.

  
Although there is no way to fix this within the MySQL server itself, a bit of
clever scripting can be run via cron to check if there is a problem.
Presenting : save_mysql

  
/usr/bin/mysql -e 'show full processlist \G;' 2> /dev/null |grep -A1 -B5 -E
"Time: [1-9][0-9][0-9]?" |grep -E "Id\:\ |State\:\ " |/usr/bin/perl -n -e
"if( $. % 2 ) { chomp $_;print $_; } else { print $_; }" |grep -E "\ State\:\
Sending\ data$|\ State\:\ Sorting\ result$" |awk {'print $2'} |xargs -iTHREAD
-r -n1 /usr/bin/mysqladmin kill THREAD &> /dev/null

  
/usr/bin/mysql -e 'show full processlist \G;' 2> /dev/nullThis line will grab
a list of all the currently running queries and commands from the MySQL
server. It also redirects any error output to the blackhole. It produces
output like so:

  

    
    *************************** 1. row ***************************Id: 842863User: adminHost: localhostdb: NULLCommand: QueryTime: 0State: NULLInfo: show full processlist

  
  
grep -A1 -B5 -E "Time: [1-9][0-9][0-9]?"The grep here will grab line directly
below and the 5 above if the time is over 100 seconds. This line can be
tweaked to grep for less time. My preference is between 30 seconds and a
minute. So instead of[1-9][0-9][0-9]you'd have[3-9][0-9] (30 seconds) OR
[6-9][0-9] (60 seconds)

  
grep -E "Id\:\ |State\:\ "This will filter out the other lines from the
previous grep and just grab the MySQL process ID and it's State.

  
/usr/bin/perl -n -e "if( $. % 2 ) { chomp $_;print $_; } else { print $_;
}"Quick Perl script to put id and state from the step above on the same line.

  
grep -E "\ State\:\ Sending\ data$|\ State\:\ Sorting\ result$"This line will
filter out the queries being run that are in the state 'Sending Data' or
'Sorting Result'. These are both states where it's safe to kill the query.

  
awk {'print $2'}This line grabs the query ID from the output.

  
xargs -iTHREAD -r -n1 /usr/bin/mysqladmin kill THREAD &> /dev/nullLastly, this
line will grab the ID from above to the mysqladmin kill command, effectively
killing the query.

