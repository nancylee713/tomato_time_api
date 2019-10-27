require 'bundler'
require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'

task :default => :spec

Dir.glob('./lib/tasks/*.rake').each { |r| import r }

begin
  require "rspec/core/rake_task"

  desc "Run all examples"

  RSpec::Core::RakeTask.new(:spec) do |t|
    t.rspec_opts = %w[--color]
    t.pattern = 'spec/**/*_spec.rb'
  end
rescue LoadError
end
