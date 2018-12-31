export RAILS_ENV=test
export RAILS_TEST_DB_NAME=notejam_test
export RAILS_TEST_DB_USER=root
export RAILS_TEST_DB_HOST=127.0.0.1
rake db:test:prepare
rake test:prepare
rake db:drop db:create db:migrate
# rake db:create
rake test
