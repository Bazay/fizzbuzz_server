require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_view/railtie"
require "sprockets/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FizzbuzzServer
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.generators do |g|
      g.template_engine :haml
      g.stylesheets     false
      g.orm             :active_record
      g.test_framework  :rspec, fixture: true, views: false
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
    end

    # Load Grape API
    config.paths.add 'app/api', glob: '**/*.rb'

    # Custom directories with classes and modules that should be loaded without namespace
    additional_paths = %W(
      #{config.root}/app/api/concerns
      #{config.root}/app/api/helpers
      #{config.root}/app/lib
      #{config.root}/app/values
    )
    config.autoload_paths   += additional_paths
    config.eager_load_paths += additional_paths

    config.i18n.available_locales = %i(en)
    config.i18n.available_locales << :test if Rails.env.dev? || Rails.env.development? || Rails.env.test?
    config.i18n.default_locale = :en

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
  end
end
