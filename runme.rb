require 'faraday'
require 'pry'
require 'json'
require 'pp'
require './app/services/trivia_api_service'
require './app/models/api_presenter'
require 'sinatra'
require 'sinatra/activerecord'
require 'pg'
require './app/models/question'
require './app/models/question_poro'
# # require 'sinatra'
# require 'sinatra-activerecord'
# require './app/models/question'

triv_api =  TriviaApiService.new
questions = triv_api.service(3,10,"easy")
api_presenter_obj = ApiPresenter.new(questions)
api_presenter_obj.question_presenter_filter
# binding.pry
pp questions

questions.each do |hash|
  poro = QuestionPoro.new(hash)
  Question.create(
    category: poro.category,
    difficulty: poro.difficulty,
    question: poro.question,
    correct_answer: poro.correct_answer,
    options: poro.options
  )
end
