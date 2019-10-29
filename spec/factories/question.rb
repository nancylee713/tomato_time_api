FactoryGirl.define do
  factory :question do
    category "categories"
    difficulty "difficulty"
    question "yadayada"
    correct_answer "correct!"
    options ['option1', 'option2', 'option3', 'option4']
    created_at "2019-10-30T14:37:48"
    updated_at "2019-10-30T14:37:48"
  end
end
