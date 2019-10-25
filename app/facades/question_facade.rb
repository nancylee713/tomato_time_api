require './app/services/trivia_api_service'
require './app/models/question_poro'

class QuestionFacade

  def initialize(input)
    @question_amount = input[:amount]
    @category = input[:category]
  end

  def raw_data
    triv_api = TriviaApiService.get_questions(amount: @question_amount, category: @category)
  end

  def load_questions
    raw_data.each do |hash|
      poro = QuestionPoro.new(hash)

      Question.create(
        category: poro.category,
        difficulty: poro.difficulty,
        question: poro.question,
        correct_answer: poro.correct_answer,
        options: poro.options
      )
    end
  end

end
