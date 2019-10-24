require 'rubygems'
require 'sinatra'
require 'sinatra/namespace'
require 'sinatra/activerecord'
require 'pg'
require './app/services/trivia_api_service'
require './app/models/api_presenter'
require './app/models/question_poro'
require './app/models/question'
require 'pry'


# Consume API
triv_api =  TriviaApiService.new
questions = triv_api.service(3,10,"easy")


# Make PORO out of raw data and load to db
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

# Endpoints
get '/ ' do
  'Welcome to Tomato Time Trivia!'
end

namespace '/api/v1' do
  before do
    content_type 'application/json'
  end

  get '/questions' do
    questions = Question.all

    [:category, :difficulty, :question].each do |filter|
      questions = questions.send(filter, params[filter]) if params[filter]
    end

    questions.to_json
  end

  get '/questions/:id' do |id|
    # need to use where instead of find AR method to return nil when id is not found
    question = Question.where(id: id).first
    halt(404, { message: 'Question Not Found'}.to_json) unless question

    question.to_json
  end
end
