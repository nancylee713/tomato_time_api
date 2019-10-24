require 'faraday'
require 'pry'
require 'json'
require 'pp'
require './app/models/game'

response = Faraday.get('https://opentdb.com/api.php?amount=5&category=20&difficulty=easy')
raw_data = response.body
data = JSON.parse(raw_data)
pp data

first_question = data["results"].first

{
  {"category"=>"Mythology",
    "difficulty"=>"easy",
    "questions" => {
      'question' => "In Norse mythology, Thor once dressed as a woman.",
      'question' => "Who in Greek mythology, who led the Argonauts in search of the Golden Fleece?",
    }
}

game = Game.new(first_question)

binding.pry
