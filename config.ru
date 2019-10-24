require 'bundler'
Bundler.require

require File.expand_path('../config/environment',  __FILE__)

require './app/controllers/tomato_time_api'
run TomatoTimeApi
