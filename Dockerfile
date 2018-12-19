FROM heroku/heroku:18-build

# Which versions?
ENV RUBY_MAJOR_VERSION 2.5.0
ENV RUBY_VERSION 2.5.1
ENV BUNDLER_VERSION 1.17.0.pre.1
ENV NODE_VERSION 8.11.3
ENV YARN_VERSION 1.5.1

ENV LC_ALL en_US.UTF-8

# Create some needed directories
RUN mkdir -p /app/user
WORKDIR /app/user

# So we can ruby in here
ENV GEM_PATH /app/heroku/ruby/bundle/ruby/$RUBY_MAJOR_VERSION
ENV GEM_HOME /app/heroku/ruby/bundle/ruby/$RUBY_MAJOR_VERSION
RUN mkdir -p /app/heroku/ruby/bundle/ruby/$RUBY_MAJOR_VERSION

# Install Ruby
RUN mkdir -p /app/heroku/ruby/ruby-$RUBY_VERSION
RUN curl -s --retry 3 -L https://heroku-buildpack-ruby.s3.amazonaws.com/heroku-18/ruby-$RUBY_VERSION.tgz | tar xz -C /app/heroku/ruby/ruby-$RUBY_VERSION
ENV PATH /app/heroku/ruby/ruby-$RUBY_VERSION/bin:$PATH

# Install Node
RUN curl -s --retry 3 -L http://s3pository.heroku.com/node/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz | tar xz -C /app/heroku/ruby/
RUN mv /app/heroku/ruby/node-v$NODE_VERSION-linux-x64 /app/heroku/ruby/node-$NODE_VERSION
ENV PATH /app/heroku/ruby/node-$NODE_VERSION/bin:$PATH

# Install Yarn
RUN curl -s --retry 3 -L https://yarnpkg.com/downloads/$YARN_VERSION/yarn-v$YARN_VERSION.tar.gz | tar xz -C /app/heroku/ruby/
RUN mv /app/heroku/ruby/yarn-v$YARN_VERSION /app/heroku/ruby/yarn-$YARN_VERSION
ENV PATH /app/heroku/ruby/yarn-$YARN_VERSION/bin:$PATH

# Install Bundler
RUN gem install bundler -v $BUNDLER_VERSION --no-ri --no-rdoc
ENV PATH /app/user/bin:/app/heroku/ruby/bundle/ruby/$RUBY_MAJOR_VERSION/bin:$PATH
ENV BUNDLE_APP_CONFIG /app/heroku/ruby/.bundle/config

# Install Sqlite
RUN apt-get update
RUN apt-get install -y sqlite3 libsqlite3-dev
RUN apt-get install -y libsqlite3-dev

# Generate secret key
ENV SECRET_KEY_BASE $(openssl rand -base64 32)

# export env vars during run time
RUN mkdir -p /app/.profile.d/
RUN echo "cd /app/user/" > /app/.profile.d/home.sh
RUN echo "export PATH=\"$PATH\" GEM_PATH=\"$GEM_PATH\" GEM_HOME=\"$GEM_HOME\" SECRET_KEY_BASE=\"\${SECRET_KEY_BASE:-$SECRET_KEY_BASE}\" BUNDLE_APP_CONFIG=\"$BUNDLE_APP_CONFIG\"" > /app/.profile.d/ruby.sh

# Make sure private dependencies are copied
COPY ./vendor /app/user/vendor

# Run bundler to cache dependencies
COPY ["Gemfile", "Gemfile.lock", "/app/user/"]
RUN bundle install --path /app/heroku/ruby/bundle --jobs 5

# run npm or yarn install
# add yarn.lock to .slugignore in your project
ADD package*.json yarn.* .npmr* /app/user/
RUN [ -f yarn.lock ] && yarn install --no-progress || npm install

# Add all files
ADD . /app/user

COPY ./init.sh /usr/bin/init.sh
RUN chmod +x /usr/bin/init.sh

ENTRYPOINT ["/usr/bin/init.sh"]
