---
layout: post
title: The Progress Bar Pysch
categories:
- Best Practices
- Sxsw
- Tools
---
A classic UX problems is communicating to users how long they'll have to wait
before their task completes. A spinner or progress bar provides feedback that
the system is, in fact, doing something, and how long that task may take.
Psychologically, progress bars create tension while progressing, and
resolution when completed.

  
From a technical standpoint, progress bars are black magic. The developer is
attempting to estimate a task based on potentially thousands of variables. In
the case of a file upload, the developer has to deal with differing network
conditions, disk performance, etc, etc, etc. Then they have to write the code
to communicate what is happening to the browser. Not a trivial task. However,
when executed well, can provide the user with reasonable feedback about their
task.

  
Lately, sites like LinkedIn, Mint.com, and OKCupid have used that same tension
to motivate users to completely fill out their profiles. During profile
creation, a progress bar is displayed indicating how far the user has come
along. Once the user completely fills out their profile, the progress bar hits
100%, and what changes? In most cases, nothing. The progress bar is just a
psychological hack to entice users to go through the entire process.

  
The question is: Exactly how effective is the progress bar at enticing users
to fully complete the task at hand? And are they actually worth it.

  

