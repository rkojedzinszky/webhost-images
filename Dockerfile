FROM alpine:3.14 AS ssh

COPY assets-ssh/ /

RUN /setup

FROM ssh AS static-base

COPY assets-static /

RUN /setup

FROM static-base AS static

USER 8080

FROM static-base AS php

ARG PHPVERSION

COPY assets-php/ /

RUN /setup ${PHPVERSION}

USER 8080
