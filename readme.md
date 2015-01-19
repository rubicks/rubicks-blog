rubicks-blog [![Build Status](https://travis-ci.org/rubicks/rubicks-blog.svg?branch=master)](https://travis-ci.org/rubicks/rubicks-blog)
============

This is the repo that builds my github pages site,
[https://rubicks.github.io/](https://rubicks.github.io/). It uses

* [hakyll][hakyll] to generate static site content
* [travis-ci][travis-ci] to continuously integrate
* [github-pages][github-pages] for hosting

Here's how I work on it:

    $ git clone git@github.com:rubicks/rubicks-blog
    $ cd rubicks-blog
    $ ghc --make site.sh
    $ ./site watch &        # start a local preview server
    $ emacs -nw stuff.md    # hack on stuff
    $ git commit -am "fixes stuff"
    $ git push


That's the easy part. The hard part was setting up Travis to perform the
automated deployment. If it's working properly, Travis will

* grab the commit
* build the (static site) content
* commit the content to [my github pages repo][my-github-pages-repo]
* push the commit

If github-pages is working properly, it will serve the freshly pushed content on
my github pages site. It may not be as simple as using [jekyll][jekyll], but
that's the price I pay for preferring [haskell][haskell] to [ruby][ruby].

To see the gritty details, consult [```build.sh```][build-sh] and
[```deploy.sh```][deploy-sh].

[hakyll]: http://jaspervdj.be/hakyll
[travis-ci]: https://travis-ci.com/
[github-pages]: https://pages.github.com/
[my-github-pages-repo]: https://github.com/rubicks/rubicks.github.io/
[my-github-pages-site]: https://rubicks.github.io/
[build-sh]: https://github.com/rubicks/rubicks-blog/blob/master/build.sh
[deploy-sh]: https://github.com/rubicks/rubicks-blog/blob/master/deploy.sh
[jekyll]: https://jekyllrb.com/
[haskell]: https://www.haskell.org/
[ruby]: https://www.ruby-lang.org/
