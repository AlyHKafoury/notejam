FROM rails:4.2.5
RUN mkdir /app
COPY ./Gemfile /app/Gemfile
COPY ./Gemfile.lock /app/Gemfile.lock
WORKDIR /app
ENV RAILS_ENV production
RUN bundle install
COPY . /app
RUN RAILS_ENV=production bundle exec rake assets:precompile
ENV RAILS_PORT 3000
ENV RAILS_SERVE_STATIC_FILES true
CMD ./run.sh