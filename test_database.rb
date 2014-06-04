require "test/unit"

load "database.rb"


class TestDatabase < Test::Unit::TestCase

  def test_should_read_0_records()
    #$stdout, $stderr = STDOUT, STDERR
    data = Database.new("test_data/0_records.csv").read_all()

    assert_equal(0, data.size())
  end


  def test_should_read_1_record()
    #$stdout, $stderr = STDOUT, STDERR
    data = Database.new("test_data/1_record.csv").read_all()

    assert_equal(1, data.size())
  end


  def test_should_read_3_records()
    data = Database.new("test_data/3_records.csv").read_all()

    assert_equal(3, data.size())
  end


  def test_should_read_1_record_question()
    #$stdout, $stderr = STDOUT, STDERR
    data = Database.new("test_data/1_record.csv").read_all()

    assert_equal('robin', data[0].question)
  end


  def test_should_read_1_record_answer()
    #$stdout, $stderr = STDOUT, STDERR
    data = Database.new("test_data/1_record.csv").read_all()

    assert_equal('smith', data[0].answers[0])
  end


  def test_should_read_1_record_marked_true()
    data = Database.new("test_data/1_record.csv").read_all()

    assert_equal(true, data[0].marked)
  end


  def test_should_read_2_records_marked_true_and_false()
    data = Database.new("test_data/2_records.csv").read_all()

    assert_equal(true, data[0].marked)
    assert_equal(false, data[1].marked)
  end


  def test_should_read_1_record_with_multiple_answers()
    data = Database.new("test_data/1_record_multi_answers.csv").read_all()

    assert_equal(3, data[0].answers.size())
  end

end