class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  http_basic_authenticate_with name: Rails.application.credentials.api[:username], password: Rails.application.credentials.api[:password]
end
