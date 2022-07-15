FROM ruby:2.7.4
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN gem install bundler
RUN bundle update --bundler
RUN gem install mgd
RUN git config --global user.email "jan@hovancik.net"
RUN git config --global user.name "Jan Hovancik"

RUN bundle install
ADD . /myapp
