FROM ruby:2.6

ARG FEEDBIN_REFRESHER_REPO

WORKDIR /app

RUN apt-get update \
    && apt-get install -y --no-install-recommends libidn11-dev \
    && rm -rf /var/lib/apt/lists/* \
    && git clone ${FEEDBIN_REFRESHER_REPO:-https://github.com/feedbin/refresher.git} /app \
    && gem install bundler \
    && bundle install \
    && rm -rf .git

RUN sed -i 's/-c [[:digit:]]*/-c ${SIDEKIQ_CONCURRENCY:-1}/g' /app/Procfile

CMD ["bundle", "exec", "foreman", "start"]

