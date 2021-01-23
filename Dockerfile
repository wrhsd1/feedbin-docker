FROM ruby:2.6

ARG FEEDBIN_URL
ARG FEEDBIN_REPO

WORKDIR /app

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    libldap-2.4-2 \
    libidn11-dev \
    dnsutils \
    postgresql-client \
    && rm -rf /var/lib/apt/lists/* \
    && gem install idn-ruby -v '0.1.0'

RUN git clone ${FEEDBIN_REPO:-https://github.com/feedbin/feedbin.git} /app

RUN gem install bundler -v '2.1.2' \
    && bundle install \
    && bundle exec rake assets:precompile

ENV RAILS_SERVE_STATIC_FILES=true

EXPOSE 3000

