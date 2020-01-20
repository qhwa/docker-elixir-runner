FROM alpine:latest

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
