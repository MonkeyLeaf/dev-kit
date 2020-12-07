FROM ruby:2.7.1

LABEL maintainer="Example Rails with MySQL" \
      description="Lightweight container with Rails 6.0 based on Ruby 2.7.1."

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && apt-get install -y \
    nodejs default-libmysqlclient-dev yarn

RUN gem install rails -v '~> 6.0'

RUN mkdir /example-app
WORKDIR /example-app

COPY ./src /example-app
ARG GEMFILE_PATH="/example-app/Gemfile"
RUN if [ -f "$GEMFILE_PATH" ]; then \
    bundle config set path 'vendor/bundle' \
    && bundle install \
    ; fi

# Add a script to be executed every time the container starts.
COPY ./config/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]