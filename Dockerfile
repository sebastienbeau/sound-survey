FROM ruby:2.7

ARG UID=999

RUN bundle config --global frozen 1

RUN DEBIAN_FRONTEND=noninteractive \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list\
    && apt-get update \
    && apt-get install -y sqlite3 nodejs vim yarn\
    && apt-get clean

RUN useradd --shell /bin/bash -u $UID -o -c "" -m ubuntu

WORKDIR /usr/src/app

COPY Gemfile  ./Gemfile
COPY Gemfile.lock ./Gemfile.lock

RUN bundle install

COPY . ./
RUN bundle exec rake assets:precompile

ENV BUILD_PACKAGE curl gpg git build-essential

USER ubuntu

# Start puma server with loco user
CMD bundle exec puma -C config/puma.rb

EXPOSE 3000
