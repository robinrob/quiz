class Record

  def initialize(question=nil, answers=nil, marked=false)
    @question = question
    @answers = answers
    @marked = marked
  end


  def question
    @question
  end


  def question=(question)
    @question=question
  end


  def answers
    @answers
  end


  def answers=(answers)
    @answers = answers
  end


  def marked
    @marked
  end


  def marked=(marked)
    @marked=marked
  end

end