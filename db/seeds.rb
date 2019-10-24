require './app/models/question'

question_1 = Question.create(category: 10, difficulty: 'easy', question: 'test', correct_answer: 'answer', options: ['answer', 'incorrect, incorrect, incorrect'])
question_2 = Question.create(category: 20, difficulty: 'medium', question: 'test', correct_answer: 'answer', options: ['answer', 'incorrect, incorrect, incorrect'])
question_3 = Question.create(category: 30, difficulty: 'hard', question: 'test', correct_answer: 'answer', options: ['answer', 'incorrect, incorrect, incorrect'])
