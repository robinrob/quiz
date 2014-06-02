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


  def test_should_read_1_record_with_question()
    #$stdout, $stderr = STDOUT, STDERR
    data = Database.new("test_data/1_record.csv").read_all()

    assert_equal('robin', data[0].question)
  end


  def test_should_read_1_record_with_question()
    #$stdout, $stderr = STDOUT, STDERR
    data = Database.new("test_data/1_record.csv").read_all()

    assert_equal('smith', data[0].answer)
  end


  def test_should_read_1_record_with_marked()
    #$stdout, $stderr = STDOUT, STDERR
    data = Database.new("test_data/1_record.csv").read_all()

    assert_equal(true, data[0].marked)
  end

end