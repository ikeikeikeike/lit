#!/bin/bash
export DISABLE_SPRING=1

rbenv exec bundle exec rake db:drop
rbenv exec bundle exec rake db:create
rbenv exec bundle exec rake railties:install:migrations
rbenv exec bundle exec rake db:migrate
rbenv exec bundle exec rake db:seed
rbenv exec bundle exec rake spree_sample:load
rbenv exec bundle exec rails g solidus_product_assembly:install

echo "UPDATE spree_prices SET currency = 'JPY' WHERE currency = 'USD';" | rbenv exec bundle exec rails dbconsole
