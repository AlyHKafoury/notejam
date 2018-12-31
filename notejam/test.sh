export RAILS_ENV=test
rake db:create
rake db:test:prepare
rake test
