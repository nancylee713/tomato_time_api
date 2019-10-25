require 'sinatra/namespace'
require './app/facades/question_facade'
require './app/models/question'
require 'json'
require 'pry'

class TomatoTimeApi < Sinatra::Base
  register Sinatra::Namespace

  get '/' do
    content_type :html
    send_file './app/public/index.html'
  end

  namespace '/api/v1' do
    before do
      content_type 'application/json'
    end

    get '/questions' do
      input = {question_amount: 3, category: 10, difficulty: 'easy'}
      QuestionFacade.new(input).load_questions
      questions = Question.all

      [:category, :difficulty, :question].each do |filter|
        questions = questions.send(filter, params[filter]) if params[filter]
      end

      questions.to_json
    end

    get '/questions/:id' do |id|
      question = Question.where(id: id).first
      halt(404, { message: 'Question Not Found'}.to_json) unless question

      question.to_json
    end
  end
end
