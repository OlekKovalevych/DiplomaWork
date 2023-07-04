# frozen_string_literal: true

require 'devise/orm/active_record'

DeviseTokenAuth.setup do |config|
  config.token_cost = Rails.env.test? ? 4 : 10
  config.require_client_password_reset_token = true
  config.enable_standard_devise_support = false
  config.change_headers_on_each_request = false
  config.cookie_name = 'auth_cookie'
  config.cookie_enabled = true
  config.cookie_attributes = {
    expires: 60.minutes,
    httponly: true,
    secure: true,
    same_site: :strict,
    path: '/'
  }
end
