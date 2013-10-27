#nilpath/ghost
My setup for running [Ghost](http://ghost.org) in a Docker container. Inspired by Orchardups version, [docker-ghost](https://github.com/orchardup/docker-ghost). Get it at `$ docker pull nilpath/ghost` or clone this repo and build the docker image yourself.

    $ docker run -d -e GHOST_URL=http://your-ghost-domain.com nilpath/ghost

##Configuration
If you're using my Docker image or my config file then there are some configuration capabilities.

* `GHOST_URL` - The base url of your Ghost blog.
* `MAILGUN_USER` - Mailgun user credential for sending mail via your ghost blog.
* `MAILGUN_PASS` - Mailgun pass credential for sending mail via your ghost blog.

##Caveats
You will lose your uploads if you upgrade Ghost by replacing the image. This is because there is no way of specifying an upload directory for Ghost yet, but [they're working on it](https://github.com/TryGhost/Ghost/issues/635). The database is saved in a volume called `/data` so it will persist just fine.

