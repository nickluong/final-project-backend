# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'
Rails.application.configure do
    config.action_cable.allowed_request_origins = [ /chrome-extension:\/\/*/, /http:\/\/*/, /https:\/\/*/ ]
end
run Rails.application
