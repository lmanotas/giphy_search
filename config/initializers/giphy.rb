Giphy::Config.setup do |conf|
  conf.api_key = Rails.application.secrets.giphy_api_key
end