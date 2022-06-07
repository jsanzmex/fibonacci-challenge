FROM ruby:2-alpine

ENV APP_PATH /var/app
ENV BUNDLE_VERSION 2.2.33
ENV BUNDLE_PATH /usr/local/bundle/gems
ENV TMP_PATH /tmp/
ENV RAILS_LOG_TO_STDOUT true
ENV RAILS_PORT 3000

# copy entrypoint scripts and grant execution permissions
COPY ./dev-entrypoint.sh /usr/local/bin/dev-entrypoint.sh
COPY ./test-entrypoint.sh /usr/local/bin/test-entrypoint.sh
RUN chmod +x /usr/local/bin/dev-entrypoint.sh && chmod +x /usr/local/bin/test-entrypoint.sh

# install dependencies for application
RUN apk -U add --no-cache \
build-base \
git \
libxml2-dev \
libxslt-dev \
# imagemagick \
tzdata \
less \
&& rm -rf /var/cache/apk/* \
&& mkdir -p $APP_PATH

RUN gem install bundler --version "$BUNDLE_VERSION" \
&& rm -rf $GEM_HOME/cache/*

# navigate to app directory
WORKDIR $APP_PATH

EXPOSE $RAILS_PORT

ENTRYPOINT [ "bundle", "exec" ]

# # Could not easily build using and alpine based image because "yarn install" depends on Python2.
# # Since we ignore if there are benefits on using alpìne for app6 apps, we defer that job to future versions of this project.
# FROM ruby:3.0.4

# # Register Yarn package source.
# RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
# RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# # Install additional packages.
# RUN apt update -qq
# RUN apt install -y nodejs yarn

# # Install Nginx (unless the solution need to expose other services like Sidekiq, we won't use NGINX)
# # RUN add-apt-repository -y ppa:nginx/stable
# # RUN apt-get update
# # RUN apt-get install -y nginx=1.10.3-0+xenial0
# # RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf
# # RUN chown -R www-data:www-data /var/lib/nginx
# # # Add default nginx config
# # ADD ./compose/app/nginx-sites.conf /etc/nginx/sites-enabled/default

# # Prepare working directory.
# RUN gem install bundler
# WORKDIR /app
# COPY Gemfile Gemfile.lock ./
# RUN bundle config build.nokogiri --use-system-libraries
# RUN bundle check || bundle install
# COPY package.json yarn.lock ./
# # This instruction includes a --check-files flag with the yarn command, a feature that makes sure any previously installed files have not been removed.
# RUN yarn install --production --check-files
# COPY . ./

# # Configure endpoint.
# COPY ./compose/local/entrypoint.sh /usr/bin/
# RUN chmod +x /usr/bin/entrypoint.sh
# ENTRYPOINT ["entrypoint.sh"]
# EXPOSE 3000

# # Start app server.
# CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
