Devise.setup do |config|
  config.secret_key = "4062daf922bbdae16ff88c7ec8448fab11e7086e6021953558845263a5755b22a6447ee3d7c044e811239280c8c7f33428eb"

  # Confirmation
  #
  # Required so users don't lose their carts when they need to confirm.
  # config.allow_unconfirmed_access_for = 1.days

  # Fixes the bug where Confirmation errors result in a broken page.
  # config.router_name = :spree

  config.reconfirmable = false
end
