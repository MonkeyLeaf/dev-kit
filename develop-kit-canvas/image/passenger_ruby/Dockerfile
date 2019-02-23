FROM phusion/passenger-ruby24:latest
MAINTAINER Cao  Tuan "caotuan92.hus@gmail.com"

# Set correct environment variables.
ENV HOME /root
# Expose Nginx HTTP service
EXPOSE 80

# Use baseimage-docker's init process.
CMD ["/sbin/my_init"]

ENV SECRET_KEY dblnrp7prhyw9o5r3tpn

# Start Nginx / Passenger
RUN rm -f /etc/service/nginx/down

# Remove the default site
RUN rm /etc/nginx/sites-enabled/default

RUN apt-get update && apt-get install -y g++ make zlib1g-dev libxml2-dev libxmlsec1-dev

# Remove Old version Nodejs
RUN apt-get purge --auto-remove -y nodejs && apt-get update

# Install Nodejs 8.x
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && apt-get update
RUN apt-get install -y nodejs

# Install  Yarn 1.7.x
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install yarn=1.7.0-1

RUN apt-get update && apt-get install -y build-essential

# remove gem bundler 1.16.3
RUN gem uninstall -i /usr/local/rvm/gems/ruby-2.4.4@global bundler
#install gem bundler 1.13.6
RUN gem install bundler --version 1.13.6


# Update for security reason
# RUN apt-get update && apt-get upgrade -y -o Dpkg::Options::="--force-confold"

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
