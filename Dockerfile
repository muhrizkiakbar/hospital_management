FROM ruby

# Install the software you need
RUN apt-get update -qq \
&& apt-get install -y \
apt-utils \
build-essential \
libpq-dev \
libjpeg-dev \
libpng-dev \
nodejs \
curl \
sudo \
&& gem install bundler

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn

ADD . /hospital_management
WORKDIR /hospital_management

COPY ./Gemfile /hospital_management/Gemfile
COPY ./Gemfile.lock /hospital_management/Gemfile.lock

RUN bundle install
RUN bundle update

COPY yarn.lock .
RUN yarn install

ENV DEFAULT_URL http://localhost:3000
# CMD ./docker-entrypoint.sh

