ENV["RACK_ENV"] = "test"

require 'bundler'
Bundler.require(:default, :test)

require File.expand_path('../../config/environment.rb', __FILE__)

require 'simplecov'
SimpleCov.start

# Load the sinatra app
require './app/controllers/tomato_time_api'

# Load the request helper
require './spec/support/trivia_helpers.rb'

# Require test libraries
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/spec'
require 'mocha/setup'
require 'rack/test'
require 'pry'
require 'webmock'

require 'rspec'
require 'shoulda-matchers'
require 'capybara/dsl'

Capybara.app = TomatoTimeApi
Capybara.save_path = 'tmp/capybara'

DatabaseCleaner.strategy = :truncation

# RSpec Mixin
module RSpecMixin
  include Rack::Test::Methods
  def app() TomatoTimeApi end
end

# within the RSpec configuration (this is the same place you have your database cleaner options set):
RSpec.configure do |c|
  c.include RSpecMixin

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
