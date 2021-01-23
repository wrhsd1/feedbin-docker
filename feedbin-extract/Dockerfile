FROM node:12

ARG FEEDBIN_EXTRACT_REPO

WORKDIR /app

RUN git clone ${FEEDBIN_EXTRACT_REPO:-https://github.com/feedbin/extract.git} /app \
    && npm install \
    && mkdir users 

COPY docker-entrypoint.sh /usr/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/bin/docker-entrypoint.sh"]
