require 'bundler'
Bundler.require

require File.expand_path('../config/environment',  __FILE__)
require File.expand_path('../app/controllers/tomato_time_api',  __FILE__)
require File.expand_path('../app/services/trivia_api_service',  __FILE__)

run TomatoTimeApi
