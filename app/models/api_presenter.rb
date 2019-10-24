require 'faraday'
require 'pry'
require 'json'
require 'pp'

class ApiPresenter
  def initialize(parsed_raw_data)
    @parsed_raw_data = parsed_raw_data
  end

  def question_presenter_filter
    clean_data_hash = Hash.new(0)
    q_arr = []
    @parsed_raw_data.each do |index|
      @parsed_raw_data.each do |question_hash|
        x = question_hash.assoc "question"
        y = question_hash.assoc "correct_answer"
        a = question_hash.assoc "category"
        b = question_hash.assoc "difficulty"
          z = ["incorrect_answers", question_hash["incorrect_answers"]]
          # binding.pry
        q_arr << x
        q_arr << y
        q_arr << a
        q_arr << b
        q_arr += z
        final = q_arr
        all_q = []
        all_q << final
        # binding.pry
      end #end each
  end #end each
end#end method

end
