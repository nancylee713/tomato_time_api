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

  it "can get questions by difficulty" do
    q1 = create(:question, difficulty: 'easy')
    q2 = create(:question, difficulty: 'easy')
    q3 = create(:question, difficulty: 'medium')
    q4 = create(:question, difficulty: 'hard')

    get "/api/v1/questions?difficulty=easy"

    questions = JSON.parse(last_response.body)

    expect(last_response).to be_ok
    expect(questions.count).to eq(2)
    expect(questions.first['difficulty']).to eq('easy')
  end

  it "can get questions by category" do
    q1 = create(:question, category: 'History')
    q2 = create(:question, category: 'History')
    q3 = create(:question, category: 'Music')
    q4 = create(:question, category: 'Science')

    get "/api/v1/questions?category=History"

    questions = JSON.parse(last_response.body)

    expect(last_response).to be_ok
    expect(questions.count).to eq(2)
    expect(questions.first['category']).to eq('History')
  end

  it "can get questions by amount" do
    create_list(:question, 10)

    get "/api/v1/questions?amount=2"

    questions = JSON.parse(last_response.body)

    expect(last_response).to be_ok
    expect(questions.count).to eq(2)
  end
end
