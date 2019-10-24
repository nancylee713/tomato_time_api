ENV["RACK_ENV"] = "test"

require 'bundler'
Bundler.require(:default, :test)

require File.expand_path('../../config/environment.rb', __FILE__)

require 'simplecov'
SimpleCov.start

require 'rspec'
require 'shoulda-matchers'
require 'capybara/dsl'
Capybara.app = TomatoTimeApi
Capybara.save_path = 'tmp/capybara'

DatabaseCleaner.strategy = :truncation

# within the RSpec configuration (this is the same place you have your database cleaner options set):
RSpec.configure do |c|
  c.include Capybara::DSL

  c.before(:all) do
    DatabaseCleaner.clean
  end
  c.after(:each) do
    DatabaseCleaner.clean
  end

  c.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  c.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  c.shared_context_metadata_behavior = :apply_to_host_groups
end
