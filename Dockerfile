FROM ruby:2.7.2-alpine

RUN apk add --update --virtual \
  runtime-deps \
  postgresql-client \
  build-base \
  libxml2-dev \
  libxslt-dev \
  nodejs \
  yarn \
  libffi-dev \
  readline \
  build-base \
  postgresql-dev \
  sqlite-dev \
  libc-dev \
  linux-headers \
  readline-dev \
  file \
  git \
  tzdata \
  vim \
  && rm -rf /var/cache/apk/*

WORKDIR /app

ENV BUNDLE_PATH /gems
COPY package.json yarn.lock /app/
RUN yarn install

COPY Gemfile Gemfile.lock /app/
RUN bundle install

COPY . /app/

ENTRYPOINT ["bin/rails"]
CMD ["s", "-b", "0.0.0.0"]

EXPOSE 3000
