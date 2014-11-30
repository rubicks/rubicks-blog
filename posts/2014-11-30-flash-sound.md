---
layout: post
title: flash sound
category: posts
---

I had a problem with the sound coming from the flash browser plugin: it
wasn't. Somewhere between youtube and my laptop speakers, the audio was getting
dropped. Luckily, [another Arch user][forum-flash-sound] has already
trouble-shot this problem. Here are the steps I followed:

    $ pacman -S lib32-alsa-plugins lib32-libcanberra-pulse
    $ pkill chromium
    $ nohup chromium &

I'm glad it's fixed---the silence was really starting to bother me.

[forum-flash-sound]: https://bbs.archlinux.org/viewtopic.php?pid=1024050#p1024050
