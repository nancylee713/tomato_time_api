namespace :import do
  require 'bundler'
  Bundler.require
  require './config/environment'
  require 'colorize'

  desc "import genearl knowledge trivas to db"
  task :general do
    destroy_all('General Knowledge')

    puts "Importing General Knowledge trivias from Trivia API...".yellow
    input = {amount: 50, category: 9}
    QuestionFacade.new(input).load_questions

    puts "#{input[:amount]} general knowledge trivias are successfully imported".green
  end

  desc "import book trivas to db"
  task :books do
    destroy_all('Entertainment: Books')

    puts "Importing Book trivias from Trivia API...".yellow
    input = {amount: 50, category: 10}
    QuestionFacade.new(input).load_questions

    puts "#{input[:amount]} book trivias are successfully imported".green
  end

  desc "import film trivias to db"
  task :film do
    destroy_all('Entertainment: Film')

    puts "Importing Film trivias from Trivia API...".yellow
    input = {amount: 50, category: 11}
    QuestionFacade.new(input).load_questions

    puts "#{input[:amount]} film trivias are successfully imported".green
  end

  desc "import television trivias to db"
  task :television do
    destroy_all('Entertainment: Television')

    puts "Importing Television trivias from Trivia API...".yellow
    input = {amount: 50, category: 14}
    QuestionFacade.new(input).load_questions

    puts "#{input[:amount]} television trivias are successfully imported".green
  end

  desc "import music trivias to db"
  task :music do
    destroy_all('Entertainment: Music')

    puts "Importing Music trivias from Trivia API...".yellow
    input = {amount: 50, category: 12}
    QuestionFacade.new(input).load_questions

    puts "#{input[:amount]} music trivias are successfully imported".green
  end

  desc "import science and nature trivias to db"
  task :science_nature do
    destroy_all('Science & Nature')

    puts "Importing Science & Nature trivias from Trivia API...".yellow
    input = {amount: 50, category: 17}
    QuestionFacade.new(input).load_questions

    puts "#{input[:amount]} science and nature trivias are successfully imported".green
  end

  desc "import geography trivias to db"
  task :geography do
    destroy_all('Geography')

    puts "Importing Geography trivias from Trivia API...".yellow
    input = {amount: 50, category: 22}
    QuestionFacade.new(input).load_questions

    puts "#{input[:amount]} geography trivias are successfully imported".green
  end

  desc "import history trivias to db"
  task :history do
    destroy_all('History')

    puts "Importing History trivias from Trivia API...".yellow
    input = {amount: 50, category: 23}
    QuestionFacade.new(input).load_questions

    puts "#{input[:amount]} history trivias are successfully imported".green
  end

  task all: [:general, :books, :film, :television, :music, :science_nature, :geography, :history]
end

desc "clear db"
task :destroy do
  cleanup
end

private

def destroy_all(category)
  puts "Destroying all #{category} trivias...".yellow
  Question.where(category: "#{category}").destroy_all
  puts "done".green
end

def cleanup
  Question.destroy_all
end
