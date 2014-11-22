---
layout: post
title: Which Printers?
category: posts
---

Q\. Which printers does cups know about and what's their stati?

A\. [lpstat][man-lpstat] knows:

{% highlight bash %}

$ lpstat -v
device for HP-Color-LaserJet-CP3525: socket://MA-PRINT6-1.pc.fracsec.com:9100

$ lpstat -a
HP-Color-LaserJet-CP3525 accepting requests since Wed 12 Mar 2014 03:09:15 PM EDT

{% endhighlight %}

Note that I'm not nearly l33t enough to setup or configure printers on the
command line. No, I had to use

{% highlight bash %}
$ system-config-printer
{% endhighlight %}

and step through the GUI. Someday, I'll figure out how to do it with nothing but
bash and cups utilities.

[man-lpstat]: http://www.cups.org/documentation.php/man-lpstat.html
