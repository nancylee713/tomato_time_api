require './config/database'

class Question < ActiveRecord::Base
  attr_reader :amount
  validates_presence_of :category, :difficulty, :question, :correct_answer, :options

  scope :category, -> (category) { where(category: category) }
  scope :difficulty, -> (difficulty) { where(difficulty: difficulty) }
  scope :question, -> (question) { where(question: /^#{question}/) }
  scope :amount, -> (amount) { where(amount: amount)}

  def self.amount(num)
    self.limit(num)
  end

end
