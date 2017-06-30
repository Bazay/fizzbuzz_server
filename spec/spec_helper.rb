ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'rspec/collection_matchers'
require 'spec_helper_methods'
require 'factory_girl_rails'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec
  config.use_transactional_fixtures = false

  config.include FactoryGirl::Syntax::Methods

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.full_backtrace = true
end
