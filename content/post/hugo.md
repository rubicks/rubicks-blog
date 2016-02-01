+++
date = "2016-02-01T15:56:58-05:00"
title = "hugo"

+++

You know that feeling you get when you find a new
(tool|library|framework|machine) and start thinking, "OMG. This is exactly what
I need to solve this problem I've been having."? That's the way I felt about
[```hugo```](hugo) when I first read about it.

My old static site generator was [hakyll](hakyll). Hakyll is a very nice and
very capable static site generator modelled on [jekyll](jekyll) and implemented
in [```haskell```](haskell). My problem with hakyll is one of availability---my
CI service of choice ([Travis](travis)) doesn't have hakyll installed on their
default images.

Now, I'm no stranger to bending remote virtual machines to my will. I can do
the debug-from-a-distance dance as well as anyone. Many months ago, when I was
fresh and new to hakyll, I spent hours reading error logs spat by distant
Travis machines, pawing through dependencies, and [```cabal```](cabal)
```install```ing package after package. It worked, eventually. I won my battle
against the ```cabal``` and the pipeline---such as it was---actually worked. It
was slow as hell (because of ```cabal```, or ```haskell```, or the JVM, or
something) but it worked nonetheless.

Then something changed. Maybe Travis upgraded the image. Maybe the ```cabal```
grew restless. Maybe [cosmic rays](https://xkcd.com/378/). I didn't know and
didn't care. I *absolutely did* know that didn't have it in me to fight the
```cabal``` anew. I went looking for something else, something easier but not
necessarily better.

Hugo is what I found. Hugo wins in all of the ways hakyll failed me. Hugo is
implemented in [```go```](go), which makes it (without much hyperbole)
available *everywhere* and faster than *anything*. Even over my feeble DSL ISP,
I can install hugo and its dependencies in 2 minutes. Even on my underpowered
laptop, I can build my entire site in 63 ms. Sixty-three milliseconds!!! Behold
the power of Go.

The content authorship workflow is nearly identical to that of Jekyll and
Hakyll. The markup "front matter" is easy on the brain. Installing and using
themes is dead simple.

tldr; Hugo wins. Consider it if you're looking for a static site generator.

[hugo]: https://gohugo.io
[hakyll]: https://jaspervdj.be/hakyll
[jekyll]: https://jekyllrb.com/
[haskell]: https://www.haskell.org
[travis]: https://travis-ci.org/
[cabal]: https://www.haskell.org/cabal/
[go]: https://golang.org
