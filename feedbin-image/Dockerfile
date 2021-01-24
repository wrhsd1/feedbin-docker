FROM ruby:2.3

ARG FEEDBIN_IMAGE_REPO

WORKDIR /app

RUN apt-get update \
    && apt-get install -y --no-install-recommends libopencv-dev \
    && rm -rf /var/lib/apt/lists/* \
    && git clone ${FEEDBIN_IMAGE_REPO:-https://github.com/feedbin/image.git} /app \
    && gem install bundler \
    && bundle install \
    && rm -rf .git

RUN sed -i 's/-c [[:digit:]]*/-c ${SIDEKIQ_CONCURRENCY:-1}/g' /app/Procfile

CMD ["bundle", "exec", "foreman", "start"]

