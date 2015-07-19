---
layout: post
title: "FizzBuzz in Go and Rust"
date: 2015-06-26 19:23
comments: true
categories:
 - code
 - go
 - rust
 - docker
---

My team and I attended DockerCon earlier this week. We went with the intention
of taking time at the hackathon to spend some time digging into what it would be
like to operate services running on Docker &amp; CoreOS. Part of the challenge
of CoreOS is that there isn't a package manager, which makes installing any
modern programming language difficult. The only way to execute code is to drop a
binary on the machine or to run code in a Docker container.

Therefore, it made a lot of sense to take some time to experiment with both Go
and Rust. It was also a ton of fun to play with some new ideas. To get a grasp
of the basics, I looked to the tried and true [FizzBuzz](http://c2.com/cgi/wiki?FizzBuzzTest).
FizzBuzz is a great exercise because it forces you to loop, use control logic
(if/else or case), and understand some basic math operators.

<!-- more -->

## Rust

[Rust](http://www.rust-lang.org/) bills itself as a language for [systems
programming](https://en.wikipedia.org/wiki/System_software). While I didn't get
far enough to determine if that was true, I did get far enough to determine that
Rust is relatively difficult to work with, in that it requires a compilation
step &amp; a run step before you can see the outcome of your code.

``` bash Run a rust program
± |master ✗| → rustc fizzbuzz.rs
± |master ✗| → ./fizzbuzz
```

It was also a bit awkward in that creating an effective code &rarr;
execute workflow required installing [Cargo](https://crates.io/) to manage the
very small package I created. Compilation was a bit on the slow side as well,
considering I only wrote 25 lines of code.

``` bash Run my rust fizzbuzz program
± |master ✗| → time cargo run
   Compiling rust v0.1.0 (file:///Users/chrishenry/Code/fizzbuzz/rust)
     Running `target/debug/rust`
1
2
[....]
Buzz

real  0m0.363s
user  0m0.292s
sys   0m0.067s
```

[Here's my implementation](https://github.com/chrishenry/fizzbuzz/tree/master/rust).

## Go

[Golang](https://golang.org/) is an open source, statically-typed language
that's been designed to make it straight forward to build reliable and efficient
software. That's what it says on the tin, and happily, that was my experience.
Go is simple to compile and run.

``` bash Run my go fizzbuzz program
± |master ✗| → time go run fizzbuzz.go
1
2
[...]
Buzz

real  0m0.132s
user  0m0.101s
sys   0m0.028s
```

It was also fast. Almost 3x faster than rust. It wound up being slightly more
code, as Go requires you to name the package, and to import the `fmt` package
just to print to `stdout`. However, the experience writing it was quite nice.
Very clear errors appeared at compile time, which was helpful as a n00b.

[Here's my FizzBuzz implementation](https://github.com/chrishenry/fizzbuzz/blob/master/go/fizzbuzz.go).

## Conclusion

Overall, it was a good learning experience to dig into the next generation of
programming languages. Rust seems promising, should I need to actually do
system programming. But Go seems like a great candidate for building fast,
portable tools.
