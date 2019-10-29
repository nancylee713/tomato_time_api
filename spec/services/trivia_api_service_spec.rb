require './spec/spec_helper'
require './app/services/trivia_api_service'

RSpec.describe TriviaApiService do
  it "can be instantiated" do
    trivia_api_service = TriviaApiService.new

    expect(trivia_api_service).to be_a TriviaApiService
  end

  it "#get_questions_by_category" do
    trivia_api_service = TriviaApiService.new
    data = trivia_api_service.get_questions(2, "History")

    expect(data).to be_a Array
    expect(data.count).to eq 2

    first_data = data.first

    expect(first_data).to be_a Hash
    expect(first_data).to have_key(:category)
    expect(first_data).to have_key(:difficulty)
    expect(first_data).to have_key(:question)
    expect(first_data).to have_key(:correct_answer)
    expect(first_data).to have_key(:incorrect_answers)
  end
end
