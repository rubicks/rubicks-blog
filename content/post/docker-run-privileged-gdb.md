+++
date = "2016-02-23T10:44:13-05:00"
draft = false
title = "docker run privileged gdb"

+++

Does this happen to you?

    $ docker run --rm -it my-image gdb -ex run /path/to/my/program
     ...
    Starting program: /path/to/my/program
    warning: Error disabling address space randomization: Operation not permitted

This is really bad because [`gdb`][gdb] depends on a *non*-randomized address
space for *lots* of things, including but not limited to setting breakpoints.

Infuriatingly, this occurred only within a [`docker-machine`][docker-machine]
([`boot2docker`][boot2docker]) virtual machine---my [Arch Linux][arch] native
[`docker`][docker] host was unaffected.

Here's what fixed it for me:

    $ docker run --privileged --rm -it my-image gdb -ex run /path/to/my/program

That's right, the magic flag is `--privileged`. Safety be damned---this is what
software debugging requires.

[arch]: https://www.archlinux.org
[boot2docker]: http://boot2docker.io/
[docker-machine]: https://docs.docker.com/machine/
[docker]: https://www.docker.com/
[gdb]: https://www.gnu.org/software/gdb/
