require "bundler"
require 'sinatra/activerecord'
require "sinatra/activerecord/rake"

task :default => :spec

require "rspec/core/rake_task"
RSpec::Core::RakeTask.new(:spec) do |t|
  t.verbose = true
end
