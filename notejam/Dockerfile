FROM rails:4.2.5
RUN mkdir /app
COPY ./Gemfile /app/Gemfile
COPY ./Gemfile.lock /app/Gemfile.lock
WORKDIR /app
ENV RAILS_ENV production
RUN bundle install
COPY . /app
RUN bundle exec rake assets:precompile
ENV RAILS_PORT 3000
ENV RAILS_SERVE_STATIC_FILES true
ENV RAILS_DB_NAME notejam_prod
ENV RAILS_DB_USER root
ENV RAILS_DB_PASSWORD ''
ENV RAILS_DB_HOST mysql
CMD ./run.sh