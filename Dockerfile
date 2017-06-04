FROM nginx:1.13.1-alpine

MAINTAINER Michael Alexander <michael@micalexander.com>

ARG FASTCGI_PASS

RUN apk add --update \
  bash \
  vim \
  && rm -rf /var/cache/apk/*

COPY nginx.conf /etc/nginx/nginx.conf

COPY docker-nginx-entrypoint /usr/local/bin/

ENTRYPOINT ["docker-nginx-entrypoint"]

USER nobody

RUN mkdir -p /tmp/nginx/
