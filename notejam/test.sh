export RAILS_ENV=test
rake db:test:prepare
rake test:prepare
rake db:drop db:create db:migrate
# rake db:create
rake test
