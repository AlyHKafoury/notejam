rake db:create
rake db:migrate
bundle exec unicorn -p $RAILS_PORT
