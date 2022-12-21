---
title: Status Update, November 2022
date: 2022-12-1
draft: true
---

Hello! Welcome to my first status update. I would like to write these at the end
of each month to tell you what I have been up to. While this blog will mostly be
about my online presence, I will give you some updates on my personal life as
well.

This month consisted mostly of schoolwork - we are nearing end of semester at
University, so things are ramping up quite a bit. Between Physics, Calculus, and
Computer Science, there is a lot to do!

I had planned on getting some side project work done during Thanksgiving break,
but unfortunately, I contracted COVID-19 right as the break started.
Consequently, not much got done in the way of side projects, or family time,
during that break. COVID absolutely wrecked me, and I was practically a
vegetable for several days. Fortunately, thanks to copious Tylenol and an
antiviral, I managed to recover right as the break ended so I could resume
classes without interruption.

## Xenoblade 3

I am on a mission to finish Xenoblade 3 before I leave home for Christmas break.
I have reached Chapter 6, and the endgame is growing ever nearer. I anticipate
that I can finish it on time, assuming that there is ~20 hours of content left.

I am streaming my journey on my Twitch channel - please stop by if you are
interested! Getting the stream to work properly has been an interesting
experience, and I intend to write a blog post on my streaming setup in the near
future. It is a fantastic tale of the benefits and the drawbacks of running
Linux on all of my computers.

## Ultimate Research Queue

Last post, I mentioned Ultimate Research Queue, which is my newest Factorio
mod. You may have noticed that the promised blog post did not appear.
Unfortunately, I have run into an issue with the mod that will require a major
re-architecture of the mod to fix, and I have become burnt out on working on it.

The issue has to do with needing to represent infinite technologies with
multiple technology slots, but the entire mod is designed around representing
real technology prototypes. I will need to refactor the mod to no longer
directly interface with prototypes, but instead show arbitrary data that is
specified. This is similar to how Recipe Book works, so it is doable, but it
will require major rewrites.

## Recipe Book

I am also working on a rewrite of Recipe Book. The current version of the mod
is bloated to all hell, and the GUI is not intuitive for many people.
Additionally, the mod must perform thousands of GUI translations before it
becomes usable, which in large modpacks, can take upwards of five minutes to
complete.

Fixing these issues requires fundamental changes across every aspect of the mod,
so an incremental rewrite was not feasible. So it was that I completely threw
out all of the code, and started rewriting it from scratch. Progress has been
steady so far - the new mod is already usable in many situations - but there is
a major hurdle that needs to be overcome.

As part of the architectural changes, the new GUI goes back to using standard
localised strings instead of plaintext translations. This reduces the number of
translations it needs to do by an order of magnitude, but worsens GUI
performance. This means that generating all of the button tooltips ahead of time
is prohibitively slow. There must be a mechanism to delay the creation of
tooltips until they are needed.

This capability currently does not exist in the mod API, so work on Recipe Book
has come to a halt. I am working on a pull request to add this capability, but
it is a non-trivial problem with many components. I expect the first draft of
be complete sometime next month, after which I will need to get it merged before
I can resume work on Recipe Book.

## Krastorio 2

This month, I sat down and worked through my email backlog, which was mostly
Krastorio-related questions and bug reports. A handful of tickets were created,
but I also fixed around half a dozen issues and released a patch.

I am switching gears to the next major version - Krastorio 2.0. Why the major
version bump? In this update, I am heavily refactoring and cleaning up the data
stage of the mod. While basic maintenance of this code is fine, with the
upcoming (eventual) release of the Factorio expansion, many things will likely
need to be updated. In order to make this process less painful, I would like to
get the data stage code into a state where it is easily digestible, documented,
and thoroughly tested with automated tests.

Work on this front has been steadily progressing, but there are 60,000 lines of
code to review and rewrite, so it will take time. If I work on it consistently,
I estimate about four months to go through and rewrite all of the code, and
at least another month to set up all of the automated tests. But these are
_absolute minimum_ estimates - they are guaranteed to slip.

## Plans for December

I am approaching finals in university soon, so the first half of December will
be very busy. However, I then have three weeks of Christmas break, and I plan on
getting a lot of modding done during that time. I will be away from home, but I
have a decent laptop, so I will be able to work just fine. Ideally, I will be
able to complete Ultimate Research Queue and make good progress on Recipe Book.

That's it for this status update. I am going to set up methods for displaying
code, images, and videos so that my future blog posts can be a bit more
interesting. See you real soon!
