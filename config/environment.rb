require "bundler"
Bundler.require

Bundler.require(Sinatra::Base.environment)

require "active_support/deprecation"
require "active_support/all"

APP_ROOT = File.expand_path("..", __dir__)

require File.join(APP_ROOT, 'config', 'database')

class App < Sinatra::Base
  set :method_override, true
  set :root, APP_ROOT
  set :views, File.join(APP_ROOT, "app", "views")
  set :public_folder, File.join(APP_ROOT, "app", "public")
end
