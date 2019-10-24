require 'faraday'
require 'pry'
require 'json'
require 'pp'

class TriviaApiService
  def service(question_amount,category,difficulty)
    response = Faraday.get("https://opentdb.com/api.php?amount=#{question_amount}&category=#{category}&difficulty=#{difficulty}")
    raw_data = response.body
    parsed_raw_data = JSON.parse(raw_data)["results"]
    # binding.pry
  end
end