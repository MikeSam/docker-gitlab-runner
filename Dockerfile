FROM alpine:3.10

MAINTAINER MikeSam <msamarin@gmail.com>

ENV BUILD_DEPS="gettext"  \
    RUNTIME_DEPS="libintl"

RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
            rsync \
            openssh-client && \ 
    set -x && \
    apk add --update $RUNTIME_DEPS && \
    apk add --virtual build_deps $BUILD_DEPS &&  \
    cp /usr/bin/envsubst /usr/local/bin/envsubst && \
    apk del build_deps && \
    rm -rf /var/cache/apk/
