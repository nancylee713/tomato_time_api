require 'spec_helper'
#run command: rake db:migrate RACK_ENV=test before you exec rspec

RSpec.describe Question, type: :model do
  describe "validations" do
    it { should validate_presence_of :category }
    it { should validate_presence_of :difficulty }
    it { should validate_presence_of :question }
    it { should validate_presence_of :correct_answer }
  end
end
