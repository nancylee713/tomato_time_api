require 'fast_jsonapi'
class QuestionSerializer
  include FastJsonapi::ObjectSerializer
  attributes :question, :category, :difficulty,
              :correct_answer, :incorrect_answers

  attribute :options do |option|

    incorrect_answers << correct_answer
    incorrect_answers
  end
end
