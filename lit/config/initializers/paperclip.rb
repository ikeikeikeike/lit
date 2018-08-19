if Rails.env.production? && ENV['GOOGLE_PROJECT'] && ENV.fetch('GOOGLE_CREDENTIALS')
  Paperclip::Attachment.default_options.merge!(
    storage: :fog,
    fog_credentials: {
      provider: 'Google',
      google_project: ENV.fetch('GOOGLE_PROJECT'),
      google_json_key_location: ENV.fetch('GOOGLE_CREDENTIALS')
    },
    fog_directory: 'lit-storage-production'
  )

  Spree::Image.attachment_definitions[:attachment].delete(:url)
  Spree::Image.attachment_definitions[:attachment].delete(:path)
end

if Rails.env.development? && ENV['GOOGLE_PROJECT'] && ENV.fetch('GOOGLE_CREDENTIALS')
  Paperclip::Attachment.default_options.merge!(
    storage: :fog,
    fog_credentials: {
      provider: 'Google',
      google_project: ENV.fetch('GOOGLE_PROJECT'),
      google_json_key_location: ENV.fetch('GOOGLE_CREDENTIALS')
    },
    fog_directory: 'lit-storage-development'
  )

  Spree::Image.attachment_definitions[:attachment].delete(:url)
  Spree::Image.attachment_definitions[:attachment].delete(:path)
end
