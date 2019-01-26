#!/bin/bash -v
export DISABLE_SPRING=1

rbenv exec bundle exec rake db:drop
rbenv exec bundle exec rake db:create
rbenv exec bundle exec rake railties:install:migrations
rbenv exec bundle exec rake db:migrate
rbenv exec bundle exec rake db:seed
rbenv exec bundle exec rake spree_sample:load
rbenv exec bundle exec rails g solidus_product_assembly:install
rbenv exec bundle exec rails g solidus_stripe:install  # rbenv exec bundle exec rails g solidus_gateway:install

echo "UPDATE spree_prices SET currency = 'JPY' WHERE currency = 'USD';" | rbenv exec bundle exec rails dbconsole
# echo "UPDATE spree_zone_members SET zoneable_id = 114;" | rbenv exec bundle exec rails dbconsole

echo "After this, you need to insert delivery method, Japanease tax and apply JPY to all of products at admin view."
