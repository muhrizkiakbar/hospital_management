FROM ruby

# Install the software you need
RUN apt-get update \
&& apt-get install -y \
apt-utils \
build-essential \
libpq-dev \
libjpeg-dev \
libpng-dev \
nodejs \
yarn \
sudo \
&& gem install bundler

COPY ./Gemfile /hospital_management/Gemfile
COPY ./Gemfile.lock /hospital_management/Gemfile.lock

WORKDIR /hospital_management

RUN bundle install
RUN bundle update

ENV DEFAULT_URL http://localhost:3000