# syntax=docker/dockerfile:experimental
FROM frolvlad/alpine-glibc:alpine-3.11_glibc-2.31

ARG apk_mirror=dl-cdn.alpinelinux.org

RUN sed -i \
  s/dl-cdn.alpinelinux.org/$apk_mirror/g \
  /etc/apk/repositories

RUN --mount=type=cache,target=/var/cache/apk,sharing=locked \
  apk update --no-cache && \
  apk add --no-cache \
    bash \
    coreutils \
    sysstat \
    iftop \
    procps

ENV APP_NAME example

WORKDIR /app

ENTRYPOINT /app/bin/$APP_NAME start
