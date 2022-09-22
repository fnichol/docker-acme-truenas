# docker-acme-truenas

[![Build Status][build-badge]][build] [![Docker Pulls][docker-badge]][docker]
[![GitHub][github-badge]][github]

A Docker image with [acme.sh][acmesh] and [deploy-freenas][] which can be used
to continually renew and deploy [Let's Encrypt][] SSL certificates.

**Table of Contents**

<!-- toc -->

- [Getting the Image](#getting-the-image)
- [Tools](#tools)
  * [acme.sh](#acmesh)
  * [deploy-freenas](#deploy-freenas)
- [Issues](#issues)
- [Contributing](#contributing)
- [Authors](#authors)
- [License](#license)

<!-- tocstop -->

## Getting the Image

The image is hosted on Docker Hub and can be pulled down with:

```console
$ docker pull fnichol/acme-truenas
```

## Tools

There are several tools installed into this image--the specific versions can be
determined by inspecting the [Dockerfile][].

### acme.sh

[acme.sh][acmesh] is a pure Unix shell script implementing ACME client protocol.
The upstream base image is taken from the [official][acmesh-image] Docker image
and the software is released under the [GNU General Public License,
v3][acmesh-license].

### deploy-freenas

[deploy-freenas][] is a Python script to deploy TLS certificates to a
FreeNAS/TrueNAS (Core/Scale) server using the FreeNAS/TrueNAS API. The Python
script is taken from the main branch of the [GitHub project][deploy-freenas]
and the software is released under the the [GNU General Public License,
v3][deploy-freenas-license].

## Issues

If you have any problems with or questions about this image, please contact us
through a [GitHub issue][issues].

## Contributing

You are invited to contribute to new features, fixes, or updates, large or
small; we are always thrilled to receive pull requests, and do our best to
process them as fast as we can.

Before you start to code, we recommend discussing your plans through a [GitHub
issue][issues], especially for more ambitious contributions. This gives other
contributors a chance to point you in the right direction, give you feedback on
your design, and help you find out if someone else is working on the same thing.

## Authors

Created and maintained by [Fletcher Nichol][fnichol] (<fnichol@nichol.ca>).

## License

This Docker image is licensed under the [MIT][license] license.

[build-badge]: https://api.cirrus-ci.com/github/fnichol/docker-acme-truenas.svg
[build]: https://cirrus-ci.com/github/fnichol/docker-acme-truenas
[cirrus]: https://cirrus-ci.org/
[docker-badge]: https://img.shields.io/docker/pulls/fnichol/acme-truenas.svg
[docker]: https://hub.docker.com/r/fnichol/acme-truenas
[dockerfile]:
  https://github.com/fnichol/docker-acme-truenas/blob/master/Dockerfile
[fnichol]: https://github.com/fnichol
[github-badge]:
  https://img.shields.io/github/tag-date/fnichol/docker-acme-truenas.svg
[github]: https://github.com/fnichol/docker-acme-truenas
[issues]: https://github.com/fnichol/docker-acme-truenas/issues
[license]:
  https://github.com/fnichol/docker-acme-truenas/blob/master/LICENSE.txt
[mksh]: https://www.mirbsd.org/mksh.htm
[posix-shell]:
  http://pubs.opengroup.org/onlinepubs/9699919799/utilities/V3_chap02.html
[acmesh-image]: https://hub.docker.com/r/neilpang/acme.sh
[acmesh-license]:
  https://github.com/acmesh-official/acme.sh/blob/master/LICENSE.md
[acmesh]: https://github.com/acmesh-official/acme.sh
[deploy-freenas-license]: https://github.com/danb35/deploy-freenas/blob/master/LICENSE
[deploy-freenas]: https://github.com/danb35/deploy-freenas
[let's encrypt]: https://letsencrypt.org/
