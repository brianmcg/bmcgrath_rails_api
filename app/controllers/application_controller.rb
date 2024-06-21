class ApplicationController < ActionController::API
	include ActionController::HttpAuthentication::Basic::ControllerMethods
  http_basic_authenticate_with name: Rails.application.credentials.api_user, password: Rails.application.credentials.api_pass
end
