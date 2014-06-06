require "test/unit"

load "record.rb"


class TestRecord < Test::Unit::TestCase

  def test_should_default_to_marked_false()
    record = Record.new("question", "answer")

    assert(false, record.marked)
  end

end