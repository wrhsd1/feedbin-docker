FROM ruby:2.6

ARG FEEDBIN_REFRESHER_REPO

WORKDIR /app

RUN apt-get update \
    && apt-get install -y --no-install-recommends libidn11-dev \
    && rm -rf /var/lib/apt/lists/* \
    && git clone ${FEEDBIN_REFRESHER_REPO:-https://github.com/feedbin/refresher.git} /app \
    && gem install bundler \
    && bundle install

CMD ["bundle", "exec", "foreman", "start"]

