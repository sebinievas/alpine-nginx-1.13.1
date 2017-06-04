FROM nginx:1.13.1-alpine

MAINTAINER Michael Alexander <michael@micalexander.com>

ARG FASTCGI_PASS

RUN apk add --update bash

RUN apk add --update vim

RUN rm -rf /var/cache/apk/*

COPY nginx.conf /etc/nginx/nginx.conf

RUN sed -i "s|fastcgi_pass php|fastcgi_pass ${FASTCGI_PASS}|g" /etc/nginx/nginx.conf

EXPOSE 80

USER nobody

RUN mkdir -p /tmp/nginx/
