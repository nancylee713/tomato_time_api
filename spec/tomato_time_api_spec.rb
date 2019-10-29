require './spec/spec_helper'

RSpec.describe 'TomatoTimeApi App' do
  it "says hello world" do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to include('Hello world!')
  end

  it "displays a list of questions" do
    get '/api/v1/questions'
    expect(last_response).to be_ok
  end
end
