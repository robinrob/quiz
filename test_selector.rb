require "test/unit"

load "record_builder.rb"
load "selector.rb"


class TestSelector < Test::Unit::TestCase

  def test_should_select_1_item()
    builder = RecordBuilder.new()
    items = [builder.with_question("question").with_answers(["answer"]).build()]

    item = Selector.new(items).select()

    assert_not_nil(item)
  end


  def test_should_select_1_marked_item()
    builder = RecordBuilder.new()
    items = [builder.with_question("question").with_answers(["answer"]).with_marked("true").build()]

    item = Selector.new(items).select()

    assert(true, item.marked)
  end

end