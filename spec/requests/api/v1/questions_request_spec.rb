require './spec/spec_helper'

describe "TomatoTime API" do
  it "says hello world" do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to include('Hello world!')
  end

  it "sends a list of questions" do
    create_list(:question, 3)

    get '/api/v1/questions'

    expect(last_response).to be_ok

    questions = JSON.parse(last_response.body)

    expect(questions.count).to eq(3)
  end
end
