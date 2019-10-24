require 'spec_helper'

RSpec.describe Question, type: :model do
  describe "validations" do
    it { should validate_presence_of :category }
    it { should validate_presence_of :difficulty }
    it { should validate_presence_of :question }
    it { should validate_presence_of :correct_answer }
    it { should validate_presence_of :options }
  end
end
