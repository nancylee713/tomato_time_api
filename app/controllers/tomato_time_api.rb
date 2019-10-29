require 'sinatra/namespace'
require './app/models/question'
require 'json'
require './config/environment'

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
      questions = Question.all

      amount = params['amount']

      [:category, :difficulty, :question, :amount].each do |filter|
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
