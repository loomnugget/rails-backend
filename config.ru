# This file is used by Rack-based servers to start the application.
require_relative 'config/environment'

# Action Cable Server - bundle exec puma -p 28080 cable/config.ru
# Rails.application.eager_load!
# run ActionCable.server

run Rails.application
