ENV["RACK_ENV"] = "test"

require 'bundler'
Bundler.require(:default, :test)
require File.expand_path('../../config/environment.rb', __FILE__)

require 'simplecov'
SimpleCov.start

require 'capybara/dsl'
Capybara.app = App
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
end
