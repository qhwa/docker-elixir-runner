# Elixir Runner Docker Image

This is a small docker runner image for [Elixir](https://elixir-lang.org) projects.

## Features

* **small** - based on [Alpine Linux](https://alpinelinux.org/about/)
* **developer friendly** - out of box with pre-installed utilities, including:
  * bash
  * iftop
  * [procps](http://procps.sourceforge.net/) with following programs:
    * *free* - Report the amount of free and used memory in the system
    * *kill* - Send a signal to a process based on PID
    * *pgrep* - List processes based on name or other attributes
    * *pkill* - Send a signal to a process based on name or other attributes
    * *pmap* - Report memory map of a process
    * *ps* - Report information of processes
    * *pwdx* - Report current directory of a process
    * *skill* - Obsolete version of pgrep/pkill
    * *slabtop* - Display kernel slab cache information in real time
    * *snice* - Renice a process
    * *sysctl* - Read or Write kernel parameters at run-time
    * *tload* - Graphical representation of system load average
    * *top* - Dynamic real-time view of running processes
    * *uptime* - Display how long the system has been running
    * *vmstat* - Report virtual memory statistics
    * *w* - Report logged in users and what they are doing
    * *watch* - Execute a program periodically, showing output fullscreen
  * [iftop](http://www.ex-parrot.com/pdw/iftop/)
  * [systat](http://sebastien.godard.pagesperso-orange.fr/)

## Conventions

The application is supposed to be located at `/app/$APP_NAME` where `APP_NAME` is the shell variable holding the project name, such as `"my_app"` for instance.

## What if I need more programs pre-installed?

You can extend this image with your own set of programs. For example, let's say we need image libraries so we can deal with user uploaded images. You can write your `Dockerfile` like this:

```docker
FROM qhwa/elixir-runner:latest

RUN apk update --no-cache && \
  apk add --no-cache \
    libpng \
    libpng-dev \
    libjpeg-turbo-utils \
    pngquant
```