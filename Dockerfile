FROM ruby:2.7.0

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee \
   /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && apt-get install -y nodejs yarn postgresql-client tzdata\
  vim locales

ENV INSTALL_PATH /opt/marketplace

RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH
RUN gem install bundler -v '~> 2.1.4'
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
ADD package.json package.json
ADD yarn.lock yarn.lock
RUN bundle install
COPY . $INSTALL_PATH