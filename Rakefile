require "bundler"
require 'sinatra/activerecord'
require "sinatra/activerecord/rake"

task :default => :spec

# require "rspec/core/rake_task"
# RSpec::Core::RakeTask.new(:spec) do |t|
#   t.verbose = true
# end

begin
  require "rspec/core/rake_task"

  desc "Run all examples"

  RSpec::Core::RakeTask.new(:spec) do |t|
    t.rspec_opts = %w[--color]
    t.pattern = 'spec/**/*_spec.rb'
  end
rescue LoadError
end
