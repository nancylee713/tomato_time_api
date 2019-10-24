require './app/models/question'
require './app/models/question_poro'
require 'rubygems'


question_1 = Question.create(category: 10, difficulty: 'easy', question: 'test', correct_answer: 'answer', options: 'incorrect, incorrect, incorrect')
question_2 = Question.create(category: 20, difficulty: 'medium', question: 'test', correct_answer: 'answer', options: 'incorrect, incorrect, incorrect')
question_3 = Question.create(category: 30, difficulty: 'hard', question: 'test', correct_answer: 'answer', options: 'incorrect, incorrect, incorrect')
