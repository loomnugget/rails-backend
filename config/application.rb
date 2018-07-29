require_relative 'boot'
require 'csv'
require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ActionCableExample
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    # NOTE: I disabled this due to the addition of cross-origin checking - doesn't
    # allow client/server to be on different domains (forgery_protection_origin_check)

    # if respond_to?(:action_controller)
    #   action_controller.per_form_csrf_tokens = true
    #   action_controller.forgery_protection_origin_check = true
    # end

    # config.load_defaults 5.2

    # Use structure.sql
    config.active_record.schema_format = :sql

    config.action_cable.mount_path = '/cable'
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # NOTE: restart server if this file is modified
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*',
        :headers => :any,
        :methods => [:put, :get, :post, :options, :delete],
        :expose => ['access-token', 'client', 'expiry', 'token-type', 'uid', 'content-disposition']
      end
    end
  end
end
