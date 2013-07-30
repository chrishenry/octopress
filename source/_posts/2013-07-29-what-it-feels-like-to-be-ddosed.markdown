---
layout: post
title: "What it feels like to be DDoS'ed"
date: 2013-07-29 23:02
comments: true
categories:
- existentialism
- thoughts
- devops
---


The internet is hostile. Not because of trolls or flame wars or your opinion on gay marriage, but because people want to destroy you. For absolutely no fucking reason. DDoS attacks are the scariest thing in the world to someone running a website.

The alerts will trickle in at first. It'll just be a web sever or two that's squawking. Then more. Then external monitoring will go off. Pingdom will mark you as down, a painful insult to your hard work, and numerous nines. Then all of the web servers will alert as down. And those alerts will keep coming. For a large infrastructure, potentially hundreds. You'll have to quit email, or turn off notifications, or the cacophony of dings and vibrations will rattle around your brain and wrestle away whatever modicum of clarity you may have. SSH hangs, pings fail, your jump server gets squirrelly, and panic mounts. Tell your boss to get on chat. Don't email, text, or call, because those channels will be fucked, occupied by automated alerts, hosting providers, vendors, and other team members.

<!-- more -->

Vendors might be confused because they can't get to key pieces of infrastructure. That infrastructure and networking gear might be shared with others, which will freak everyone out more. If the attack is large enough, they may be experiencing the same feelings. You feel shitty, knowing this affected others, but you feel it later, because you can't possibly feel more feelings. Hopefully your vendors have dealt with this before. Hopefully they know what they're doing. Hopefully they'll have an update in a few minutes. Hopefully that update won't be that they null-routed your IP.

When the attack is several times larger than your subscribed bandwidth, service is denied. To your customers, to your team, and probably to upstream infrastructure. ISPs can't, and sometimes wont, help. In fact, they're likely to shun you. The dreaded null route, where there's no hope of coming back up anytime soon. That's the moment when there's nothing you can do because the infrastructure leading to your environment has been overwhelmed.



A DDoS never happens at a convenient time. They happen late at night, during a team outing, or when you just took a sleeping pill, or have a major launch to contend with. The randomness is just another thing that makes you feel helpless, and ineffective. Impotent.

Once you've picked up the pieces, and mitigated, or waited it out, that's when exhaustion comes. Or rage, then exhaustion. When and if you finally get to sleep the night after the attack, it'll be fleeting. You'll wake up often, check your phone, looking for alerts or a sign that it happened again. You'll wake up early the next day, nowhere near rested, go back to the office and wait.

Incidents beg the question "who would do such a thing?". Particularly when during your tenure, you've never done anything to hurt anyone, and  your service was designed to help people. Hell, even your competitors even respect you. The whole thing was birthed to help people, the little people, the people who always get taken advantage of. You love this site on some level, or you wouldn't be part of the response. If you don't love it, you at least feel a duty to protect it. If you don't fall into either category, and are blissfully unaware, or asleep, you're a either a prick or incompetent.

Once it's over, you constantly fear they'll come back. Thoughts and theories swirl about, unchecked. People will ask about the perpetrators, and you can only shrug, wearily. In the vacuum of facts, folks will supply their own theories. The conjecture about the attackers will be endless, the convo du jour.

 - They did it for the lulz.
 - They were definitely Chinese.
 - They did because they had a botnet and nothing better to do.
 - They did it because they hate our guts.
 - It's an Eastern European douchebag.
 - There was a guy who called into support and was pissed, I bet it was him.
 - They did it because they want to hurt someone who's using the service.
 - They targeted you because of who you're working with.
 - It's some fat slob asshole who lives in his mother's basement and he didn't get any meatloaf.
 - It was Prism.

Conjecture is useless. The attacker doesn't have a face. And even if it does, it's extremely unlikely you'll ever see it. The sad fact is that there will be no Liam Neeson Taken-style vengeance. You won't suddenly appear on another continent, infiltrate their lair, and punch their teeth down their throat. No matter how bad you may want to.

When you get into the office again, you'll likely be hailed as a hero. After all, you "fought the hackers." Deep down, even after you got everything back in place, you still feel a little bit like a failure, because it happened at all. You take the congratulations sheepishly, through bleary eyes, deathly afraid of the next attack.

Pragmatically, most of your energy should be focused on things like re-ip'ing your web site. Engaging with hosting providers to get mitigation services in place, talking directly to mitigation experts to see what help they can be, analyzing the attack to see if there are ports that can be closed to an attacker completely, fixing your application to handle the closing of ports that were attacked on, standing up services to get around ports being closed, altering your application to gather inputs in a more intelligent way after the hacks that were put in place assuming there would never be any serious infrastructure changes made without seriously considering them first.

You have a lot of work to do.
