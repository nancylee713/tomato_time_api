class QuestionPoro
  attr_reader :category, :difficulty, :question, :correct_answer, :options

  def initialize(question_data)
    @category = question_data[:category]
    @difficulty = question_data[:difficulty]
    @question = question_clean(question_data[:question])
    @correct_answer = question_clean(question_data[:correct_answer])
    incorrect_answers = question_clean(question_data[:incorrect_answers])
    @options = incorrect_answers << @correct_answer
  end

  def question_clean(data)
    map = {'&quot;' => '', '&#039;'=> "'", '&rsquo;'=> "'"}

    if data.kind_of?(Array)
      map.each { |k,v| data.map do |str| str.gsub!(k,v) end }
    else
      map.each { |k,v| data.gsub!(k,v) }
    end

    data
  end

  def question_clean

  end
end
