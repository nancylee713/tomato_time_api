source 'https://rubygems.org'

gem 'sinatra', require: 'sinatra/base'
gem 'sinatra-contrib', require: 'sinatra/reloader'
gem 'rake'
gem 'activerecord'
gem 'sinatra-activerecord'
gem 'faraday'
gem 'figaro'
gem 'pg'
gem 'fast_jsonapi'
gem 'colorize'

group :test do
  gem 'multi_json'
  gem 'mocha', '~> 0.14.0', require: false
  gem 'minitest'
  gem 'rack-test', require: false
  gem 'test-unit'
end

group :development, :test do
  gem 'shotgun'
  gem 'tux'
  gem 'pry'
  gem 'rspec'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'launchy'
  gem 'simplecov'
  gem 'rack-test'
  gem "shoulda-matchers", "~> 2.4.0", require: false
end
