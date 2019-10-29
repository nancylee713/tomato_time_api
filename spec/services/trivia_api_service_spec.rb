require './spec/spec_helper'
# require './app/services/trivia_api_service'

RSpec.describe TriviaApiService do
  it "can be instantiated" do
    trivia_api_service = TriviaApiService.new

    expect(trivia_api_service).to be_a TriviaApiService
  end

  it "#get_questions_by_category" do
    json_response =  File.open("./app/fixtures/sports_question_api_call.json")
    binding.pry
    WebMock.stub_request(:get, 'https://opentdb.com/api.php?amount=3&category=21&difficulty=easy&type=multiple').
      to_return(status: 200, body: json_response)
    # trivia_api_service = TriviaApiService.new
    # data = trivia_api_service.get_questions(2, "History")
    #
    # expect(data).to be_a Array
    # binding.pry
    # expect(data.count).to eq 2
    #
    # member = data.first
    #
    # expect(member).to be_a Hash
    # expect(member).to have_key(:category)
    # expect(member).to have_key(:difficulty)
    # expect(member).to have_key(:question)
    # expect(member).to have_key(:correct_answer)
    # expect(member).to have_key(:incorrect_answers)
  end
end
