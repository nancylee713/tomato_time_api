require 'faraday'
require 'pry'
require 'json'
require 'pp'
response = Faraday.get('https://opentdb.com/api.php?amount=5&category=20&difficulty=easy')
raw_data = response.body
data = JSON.parse(raw_data)
pp data

# binding.pry
