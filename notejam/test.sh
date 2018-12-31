export RAILS_ENV=test
rake db:drop db:create db:migrate
# rake db:create
rake db:test:prepare
rake test
