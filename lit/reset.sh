#!/bin/bash
export DISABLE_SPRING=1

rbenv exec bundle exec rake db:drop
rbenv exec bundle exec rake db:create
rbenv exec bundle exec rake railties:install:migrations
rbenv exec bundle exec rake db:migrate
rbenv exec bundle exec rake db:seed
rbenv exec bundle exec rake spree_sample:load
rbenv exec bundle exec rails g solidus_social:install
rbenv exec bundle exec rails g solidus_product_assembly:install

echo "UPDATE spree_prices SET currency = 'JPY' WHERE currency = 'USD';" | rbenv exec bundle exec rails dbconsole

# (echo "UPDATE spree_states SET name = '北海道' WHERE abbr = '01' AND country_id = 114;" | rbenv exec bundle exec rails dbconsole) &
# (echo "UPDATE spree_states SET name = '青森'   WHERE abbr = '02' AND country_id = 114;" | rbenv exec bundle exec rails dbconsole) &
# (echo "UPDATE spree_states SET name = '岩手'   WHERE abbr = '03' AND country_id = 114;" | rbenv exec bundle exec rails dbconsole) &
# (echo "UPDATE spree_states SET name = '宮城'   WHERE abbr = '04' AND country_id = 114;" | rbenv exec bundle exec rails dbconsole) &
# (echo "UPDATE spree_states SET name = '秋田'   WHERE abbr = '05' AND country_id = 114;" | rbenv exec bundle exec rails dbconsole) &
# (echo "UPDATE spree_states SET name = '山形'   WHERE abbr = '06' AND country_id = 114;" | rbenv exec bundle exec rails dbconsole) &
# (echo "UPDATE spree_states SET name = '福島'   WHERE abbr = '07' AND country_id = 114;" | rbenv exec bundle exec rails dbconsole) &
# (echo "UPDATE spree_states SET name = '茨城'   WHERE abbr = '08' AND country_id = 114;" | rbenv exec bundle exec rails dbconsole) &
# (echo "UPDATE spree_states SET name = '栃木'   WHERE abbr = '09' AND country_id = 114;" | rbenv exec bundle exec rails dbconsole) &
# (echo "UPDATE spree_states SET name = '群馬'   WHERE abbr = '10' AND country_id = 114;" | rbenv exec bundle exec rails dbconsole) &
# (echo "UPDATE spree_states SET name = '埼玉'   WHERE abbr = '11' AND country_id = 114;" | rbenv exec bundle exec rails dbconsole) &
# echo "UPDATE spree_states SET name = '千葉'   WHERE abbr = '12' AND country_id = 114;" | rbenv exec bundle exec rails dbconsole
# (echo "UPDATE spree_states SET name = '東京'   WHERE abbr = '13' AND country_id = 114;" | rbenv exec bundle exec rails dbconsole) &
# (echo "UPDATE spree_states SET name = '神奈川' WHERE abbr = '14' AND country_id = 114;" | rbenv exec bundle exec rails dbconsole) &
# (echo "UPDATE spree_states SET name = '新潟'   WHERE abbr = '15' AND country_id = 114;" | rbenv exec bundle exec rails dbconsole) &
# (echo "UPDATE spree_states SET name = '富山'   WHERE abbr = '16' AND country_id = 114;" | rbenv exec bundle exec rails dbconsole) &
# (echo "UPDATE spree_states SET name = '石川'   WHERE abbr = '17' AND country_id = 114;" | rbenv exec bundle exec rails dbconsole) &
# (echo "UPDATE spree_states SET name = '福井'   WHERE abbr = '18' AND country_id = 114;" | rbenv exec bundle exec rails dbconsole) &
# (echo "UPDATE spree_states SET name = '山梨'   WHERE abbr = '19' AND country_id = 114;" | rbenv exec bundle exec rails dbconsole) &
# (echo "UPDATE spree_states SET name = '長野'   WHERE abbr = '20' AND country_id = 114;" | rbenv exec bundle exec rails dbconsole) &
# (echo "UPDATE spree_states SET name = '岐阜'   WHERE abbr = '21' AND country_id = 114;" | rbenv exec bundle exec rails dbconsole) &
# (echo "UPDATE spree_states SET name = '静岡'   WHERE abbr = '22' AND country_id = 114;" | rbenv exec bundle exec rails dbconsole) &
# (echo "UPDATE spree_states SET name = '愛知'   WHERE abbr = '23' AND country_id = 114;" | rbenv exec bundle exec rails dbconsole) &
# (echo "UPDATE spree_states SET name = '三重'   WHERE abbr = '24' AND country_id = 114;" | rbenv exec bundle exec rails dbconsole) &
# echo "UPDATE spree_states SET name = '滋賀'   WHERE abbr = '25' AND country_id = 114;" | rbenv exec bundle exec rails dbconsole
# (echo "UPDATE spree_states SET name = '京都'   WHERE abbr = '26' AND country_id = 114;" | rbenv exec bundle exec rails dbconsole) &
# (echo "UPDATE spree_states SET name = '大阪'   WHERE abbr = '27' AND country_id = 114;" | rbenv exec bundle exec rails dbconsole) &
# (echo "UPDATE spree_states SET name = '兵庫'   WHERE abbr = '28' AND country_id = 114;" | rbenv exec bundle exec rails dbconsole) &
# (echo "UPDATE spree_states SET name = '奈良'   WHERE abbr = '29' AND country_id = 114;" | rbenv exec bundle exec rails dbconsole) &
# (echo "UPDATE spree_states SET name = '和歌山' WHERE abbr = '30' AND country_id = 114;" | rbenv exec bundle exec rails dbconsole) &
# (echo "UPDATE spree_states SET name = '鳥取'   WHERE abbr = '31' AND country_id = 114;" | rbenv exec bundle exec rails dbconsole) &
# (echo "UPDATE spree_states SET name = '島根'   WHERE abbr = '32' AND country_id = 114;" | rbenv exec bundle exec rails dbconsole) &
# (echo "UPDATE spree_states SET name = '岡山'   WHERE abbr = '33' AND country_id = 114;" | rbenv exec bundle exec rails dbconsole) &
# (echo "UPDATE spree_states SET name = '広島'   WHERE abbr = '34' AND country_id = 114;" | rbenv exec bundle exec rails dbconsole) &
# (echo "UPDATE spree_states SET name = '山口'   WHERE abbr = '35' AND country_id = 114;" | rbenv exec bundle exec rails dbconsole) &
# echo "UPDATE spree_states SET name = '徳島'   WHERE abbr = '36' AND country_id = 114;" | rbenv exec bundle exec rails dbconsole
# (echo "UPDATE spree_states SET name = '香川'   WHERE abbr = '37' AND country_id = 114;" | rbenv exec bundle exec rails dbconsole) &
# (echo "UPDATE spree_states SET name = '愛媛'   WHERE abbr = '38' AND country_id = 114;" | rbenv exec bundle exec rails dbconsole) &
# (echo "UPDATE spree_states SET name = '高知'   WHERE abbr = '39' AND country_id = 114;" | rbenv exec bundle exec rails dbconsole) &
# (echo "UPDATE spree_states SET name = '福岡'   WHERE abbr = '40' AND country_id = 114;" | rbenv exec bundle exec rails dbconsole) &
# (echo "UPDATE spree_states SET name = '佐賀'   WHERE abbr = '41' AND country_id = 114;" | rbenv exec bundle exec rails dbconsole) &
# (echo "UPDATE spree_states SET name = '長崎'   WHERE abbr = '42' AND country_id = 114;" | rbenv exec bundle exec rails dbconsole) &
# (echo "UPDATE spree_states SET name = '熊本'   WHERE abbr = '43' AND country_id = 114;" | rbenv exec bundle exec rails dbconsole) &
# (echo "UPDATE spree_states SET name = '大分'   WHERE abbr = '44' AND country_id = 114;" | rbenv exec bundle exec rails dbconsole) &
# echo "UPDATE spree_states SET name = '宮崎'   WHERE abbr = '45' AND country_id = 114;" | rbenv exec bundle exec rails dbconsole
# echo "UPDATE spree_states SET name = '鹿児島' WHERE abbr = '46' AND country_id = 114;" | rbenv exec bundle exec rails dbconsole
# echo "UPDATE spree_states SET name = '沖縄'   WHERE abbr = '47' AND country_id = 114;" | rbenv exec bundle exec rails dbconsole


echo "After this, you need to insert delivery method, japanease tax and apply JPY to all of products at admin view."


