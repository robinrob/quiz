require "test/unit"

load "question.rb"


class TestRecord < Test::Unit::TestCase

  def test_should_default_to_marked_false()
    record = Question.new("question", "answer")

    assert(!record.marked, "record.marked should be false")
  end


  def test_should_default_to_score_0()
    record = Question.new("question", "answer")

    assert_equal(0, record.score)
  end

end