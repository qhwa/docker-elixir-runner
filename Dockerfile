FROM alpine:3.11

ARG apk_mirror=dl-cdn.alpinelinux.org

RUN sed -i \
  s/dl-cdn.alpinelinux.org/$apk_mirror/g \
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
ENV GLIBC_VERSION 2.30-r0

RUN apk add --update curl && \
  curl -sSLo /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
  curl -sSLo glibc.apk "https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk" && \
  curl -sSLo glibc-bin.apk "https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-bin-${GLIBC_VERSION}.apk" && \
  apk add glibc-bin.apk glibc.apk && \
  /usr/glibc-compat/sbin/ldconfig /lib /usr/glibc-compat/lib && \
  rm -rf glibc.apk glibc-bin.apk /var/cache/apk/

COPY console /usr/bin/console 

WORKDIR /app
ENTRYPOINT /app/bin/$APP_NAME start
