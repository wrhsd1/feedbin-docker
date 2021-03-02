FROM node:12-alpine

ARG FEEDBIN_EXTRACT_REPO

WORKDIR /app

RUN apk --virtual build-deps add git \
    && git clone ${FEEDBIN_EXTRACT_REPO:-https://github.com/feedbin/extract.git} /app \
    && npm install \
    && mkdir users \
    && rm -rf .git \
    && apk del build-deps \
    && rm -rf /var/cache/apk/*

COPY docker-entrypoint.sh /usr/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/bin/docker-entrypoint.sh"]
