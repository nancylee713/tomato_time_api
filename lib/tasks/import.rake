namespace :import do
  require 'bundler'
  Bundler.require
  require './config/environment'
  require 'colorize'

  desc "import book trivias to db"
  task :books do
    destroy_all_books

    puts "Importing Book trivias from Trivia API...".yellow
    input = {amount: 50, category: 10}
    QuestionFacade.new(input).load_questions

    puts "#{input[:amount]} book trivias are successfully imported".green
  end

  desc "import film trivias to db"
  task :film do
    destroy_all_film

    puts "Importing Film trivias from Trivia API...".yellow
    input = {amount: 50, category: 11}
    QuestionFacade.new(input).load_questions

    puts "#{input[:amount]} film trivias are successfully imported".green
  end

  desc "import music trivias to db"
  task :music do
    destroy_all_music

    puts "Importing Music trivias from Trivia API...".yellow
    input = {amount: 50, category: 12}
    QuestionFacade.new(input).load_questions

    puts "#{input[:amount]} music trivias are successfully imported".green
  end

  desc "import computer trivias to db"
  task :computer do
    destroy_all_computer

    puts "Importing Computer trivias from Trivia API...".yellow
    input = {amount: 50, category: 18}
    QuestionFacade.new(input).load_questions

    puts "#{input[:amount]} computer trivias are successfully imported".green
  end

  desc "import history trivias to db"
  task :history do
    destroy_all_history

    puts "Importing History trivias from Trivia API...".yellow
    input = {amount: 50, category: 23}
    QuestionFacade.new(input).load_questions

    puts "#{input[:amount]} history trivias are successfully imported".green
  end

  task all: [:books, :film, :music, :computer, :history]
end

private

def destroy_all_books
  puts "Destroying all book trivias...".yellow
  Question.where("category = 'Entertainment: Books'").destroy_all
  puts "done".green
end

def destroy_all_film
  puts "Destroying all film trivias...".yellow
  Question.where("category = 'Entertainment: Film'").destroy_all
  puts "done".green
end

def destroy_all_music
  puts "Destroying all music trivias...".yellow
  Question.where("category = 'Entertainment: Music'").destroy_all
  puts "done".green
end

def destroy_all_computer
  puts "Destroying all computer trivias...".yellow
  Question.where("category = 'Science: Computers'").destroy_all
  puts "done".green
end

def destroy_all_history
  puts "Destroying all history trivias...".yellow
  Question.where("category = 'History'").destroy_all
  puts "done".green
end
