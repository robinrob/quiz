load 'record.rb'

class RecordBuilder

  def initialize
    @record = Record.new()
  end


  def with_question(question)
    @record.question = question
    self
  end


  def with_answers(answers)
    @record.answers = answers
    self
  end


  def with_marked(marked)
    @record.marked = marked
    self
  end


  def build
    @record
  end

end