require 'bundler'
gem 'rack'
Bundler.require

require File.expand_path('../config/environment',  __FILE__)
ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')

run TomatoApi
