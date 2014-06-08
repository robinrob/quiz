class Record

  attr_reader :question
  attr_reader :answers
  attr_accessor :marked
  attr_accessor :score


  def initialize(question=nil, answers=nil, marked=false, score=0)
    @question = question
    @answers = answers
    @marked = marked
    @score = score.to_i
  end


  def to_csv
    "" + [@question,@answers,@marked,@score].join(",") + "\n"
  end

end