require 'bundler'
require 'rubygems'
require 'sinatra'
# require './web'
# Bundler.require
Bundler.require(:default)
Bundler.require(Sinatra::Base.environment)
require File.expand_path('../config/environment',  __FILE__)
require File.expand_path('../app/controllers/tomato_time_api',  __FILE__)
require File.expand_path('../app/services/trivia_api_service',  __FILE__)

run TomatoTimeApi
