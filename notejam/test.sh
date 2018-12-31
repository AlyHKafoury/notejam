export RAILS_ENV=test
rake db:environment:set RAILS_ENV=test
# rake db:create
rake db:test:prepare
rake test
