require 'faraday'
require 'pry'
require 'json'
require 'pp'
require './app/serializers/question_serializer'
# require './app/services/trivia'

class QuestionPoro
  attr_reader :category, :difficulty, :question, :correct_answer, :options

  def initialize(question_data)
    @category = question_data['category']
    @difficulty = question_data['difficulty']
    @question = question_data['question']
    @correct_answer = question_data['correct_answer']
    @options = question_data['incorrect_answers'] << @correct_answer
  end




end
