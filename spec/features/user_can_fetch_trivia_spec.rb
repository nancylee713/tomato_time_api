require 'spec_helper'
#run command: rake db:migrate RACK_ENV=test before you exec rspec

RSpec.describe "user can fetch trivia" do
  it "by books, medium difficulty" do
    visit '/'
  end
end
