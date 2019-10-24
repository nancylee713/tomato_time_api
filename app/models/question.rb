class Question < ActiveRecord::Base
  validates_presence_of :category, :difficulty, :question, :correct_answer
end
