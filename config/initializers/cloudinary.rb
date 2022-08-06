# Replace the 'config_from_url' string value below with your
# account's credentials, available from your Cloudinary console.
# =====================================================

require 'cloudinary'

Cloudinary.config_from_url("cloudinary://#{ENV['API_KEY']}:#{ENV['API_SECRET']}@#{ENV['CLOUD_NAME']}")
Cloudinary.config do |config|
  config.secure = true
end
