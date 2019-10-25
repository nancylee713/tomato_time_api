require 'faraday'
require 'json'

class TriviaApiService
  def self.get_questions(amount:, category:)
    new.get_questions(amount, category)
  end

  def get_questions(amount, category)
    response = Faraday.get 'https://opentdb.com/api.php/', {
      amount: amount,
      category: category,
      type: 'multiple'
    }
    json = JSON.parse(response.body, symbolize_names: true)[:results]
  end
end
