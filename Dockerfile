ARG BASE=alpine:3.18

FROM ${BASE} AS ssh

LABEL org.opencontainers.image.authors "Richard Kojedzinszky <richard@kojedz.in>"
LABEL org.opencontainers.image.source https://github.com/rkojedzinszky/webhost-images

COPY assets-ssh/ /

RUN /setup

FROM ssh AS static-base

COPY assets-static /

RUN /setup

CMD ["/usr/sbin/httpd", "-DFOREGROUND", "-T"]

FROM static-base AS static

USER 8080

FROM static-base AS php

ARG PHPVERSION

COPY assets-php/ /

RUN /setup ${PHPVERSION}

USER 8080
