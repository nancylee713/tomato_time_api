require 'bundler'
require './app'
require File.expand_path('../config/environment',  __FILE__)
Bundler.require
run Sinatra::Application
run TomatoApi

# ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')
