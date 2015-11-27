# Configuring giphy api_key using Giphy::Config and #setup method
# Is taking the token from secrets yml
Giphy::Config.setup do |conf|
  conf.api_key = Rails.application.secrets.giphy_api_key
end