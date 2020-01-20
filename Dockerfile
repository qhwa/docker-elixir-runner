FROM alpine:latest

ARG apk_mirror=dl-cdn.alpinelinux.org

RUN sed -i \
  s/dl-cdn.alpinelinux.org/${apk_mirror}/g \
  /etc/apk/repositories

RUN apk update --no-cache && \
  apk add --no-cache \
    bash \
    alpine-sdk \
    coreutils \
    sysstat \
    iftop \
    procps

ENV APP_NAME example
COPY console /usr/bin/console
