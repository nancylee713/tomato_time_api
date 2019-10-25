require 'bundler'
Bundler.require

require File.expand_path('../config/environment',  __FILE__)
require File.expand_path('../app/controllers/tomato_time_api',  __FILE__)

run TomatoTimeApi
