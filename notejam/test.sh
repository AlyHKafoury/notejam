export RAILS_ENV=test
rake db:reset
# rake db:create
rake db:test:prepare
rake test
