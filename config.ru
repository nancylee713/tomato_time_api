require 'bundler'
Bundler.require

require File.expand_path('../config/environment',  __FILE__)

require './app/test'
run App
