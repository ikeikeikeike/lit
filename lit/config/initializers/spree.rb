# Configure Solidus Preferences
# See http://docs.solidus.io/Spree/AppConfiguration.html for details

Spree.config do |config|
  # Core:

  # Default currency for new sites
  config.currency = "JPY"
  ActiveMerchant::Billing::Gateway.currencies_without_fractions =
    ActiveMerchant::Billing::Gateway.currencies_without_fractions - ["JPY"]
  ActiveMerchant::Billing::StripeGateway.currencies_without_fractions =
    ActiveMerchant::Billing::StripeGateway.currencies_without_fractions - ["JPY"]

  # from address for transactional emails
  config.mails_from = "info@loveistokyo.jp"

  # add manually
  config.max_level_in_taxons_menu = 3
  config.admin_products_per_page  = 20
  config.products_per_page        = 18
  config.default_country_iso      = 'JP'
  config.default_country_id       = 114  # japan
  config.checkout_zone            = 'Asia + English'

  # Uncomment to stop tracking inventory levels in the application
  # config.track_inventory_levels = false

  # When set, product caches are only invalidated when they fall below or rise
  # above the inventory_cache_threshold that is set. Default is to invalidate cache on
  # any inventory changes.
  # config.inventory_cache_threshold = 3


  # Frontend:

  # Custom logo for the frontend
  config.logo = "loveistokyo/loveistokyo.png"

  # Template to use when rendering layout
  # config.layout = "spree/layouts/spree_application"


  # Admin:

  # Custom logo for the admin
  config.admin_interface_logo = "loveistokyo/72width.png"

  # Gateway credentials can be configured statically here and referenced from
  # the admin. They can also be fully configured from the admin.
  #
  # config.static_model_preferences.add(
  #   Spree::Gateway::StripeGateway,
  #   'stripe_env_credentials',
  #   secret_key: ENV['STRIPE_SECRET_KEY'],
  #   publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
  #   server: Rails.env.production? ? 'production' : 'test',
  #   test_mode: !Rails.env.production?
  # )
end

Spree::Frontend::Config.configure do |config|
  config.locale = 'ja'
end

Spree::Backend::Config.configure do |config|
  config.locale = 'ja'
end

Spree::Api::Config.configure do |config|
  config.requires_authentication = true
end

Spree.user_class = "Spree::LegacyUser"

