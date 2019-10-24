require 'faraday'
require 'pry'
require 'json'
require 'pp'
require './app/services/trivia_api_service'
require './app/models/api_presenter'

triv_api =  TriviaApiService.new
questions = triv_api.service(3,10,"easy")
api_presenter_obj = ApiPresenter.new(questions)
api_presenter_obj.question_presenter_filter
pp questions
