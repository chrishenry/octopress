---
layout: post
title: "Flight Status"
date: 2014-11-02 16:13
comments: true
categories:
 - travel
 - research
 - ops
---

A few weeks ago, I was stuck in an airport for a couple hours. I was flying to San Francisco, and upon arriving to JFK, was informed my flight would be delayed several hours due to a [ground delay program](http://en.wikipedia.org/wiki/Ground_delay_program). A ground delay program is put in place when a particular airport's ability to keep up with traffic is diminished. If your destination airport has a program in place, your takeoff will be delayed until the destination recovers.

A ground delay program is the operations equivalent of shedding load. ATC essentially stops allowing inbound flights to take off to allow for the extra time and care it takes for en-route flights to land safely. This is very similar to [Netflix's implementation of the CircuitBreaker pattern](http://techblog.netflix.com/2011/12/making-netflix-api-more-resilient.html), as it allows the resource having trouble to recover while keeping flights en route at a minimum.

While I was stuck, I found there's a couple really neat tools that can tell you a little about your chances of getting there on time.

#### FAA

The FAA is kind enough to supply information on delays [here](http://www.fly.faa.gov/flyfaa/usmap.jsp). However, I found the information to be presented here a bit disingenuous. The map continued to show my destination airport as green, although flights were actually being held at departure points.


#### FlightStats.com

[They](http://www.flightstats.com) have a delay index where every destination airport is given a ranking of 0 through 5, 0 being totally on time, and 5 meaning go back to the airport bar and grab another beer. They also very helpfully track whether that index is trending up or down. These relate directly to how long a Ground Delay Program has been running. The longer that ground delay program runs, they more likely that index is going to going to trend up. They also provide a listing of flights to your destination airport that you can use to benchmark how delayed other flights and airlines are.
