require 'database_cleaner'

RSpec.configure do |config|
  config.before :suite do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with :truncation, pre_count: true
  end

  config.around :each, truncate: true do |example|
    DatabaseCleaner.strategy = :truncation, { pre_count: true }
    example.run
    DatabaseCleaner.strategy = :transaction
  end

  config.around :each do |example|
    DatabaseCleaner.cleaning(&example)
  end
end
