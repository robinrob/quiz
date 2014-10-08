require "test/unit"

load "database.rb"


class TestDatabase < Test::Unit::TestCase

  def test_should_read_0_records()
    data = Database.new("test_data/0_records.csv").read_all()

    assert_equal(0, data.size())
  end


  def test_should_read_1_record()
    $stdout, $stderr = STDOUT, STDERR
    data = Database.new("test_data/1_record.csv").read_all()

    assert_equal(1, data.size())
  end


  def test_should_read_3_records()
    data = Database.new("test_data/3_records.csv").read_all()

    assert_equal(3, data.size())
  end


  def test_should_read_1_record_question()
    data = Database.new("test_data/1_record.csv").read_all()

    assert_equal('robin', data[0].question)
  end


  def test_should_read_1_record_answer()
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


  def test_should_write_raw_data()
    filename = "test_data/new_database.csv"
    database = Database.new(filename)
    question = "robin"
    answers = "smith"

    raw_data = Array.new(["question,answer,marked\n", "#{question},#{answers}"])

    database.write_raw(raw_data)

    data = Database.new(filename).read_all()

    assert_equal(1, data.size())
    assert_equal(question, data[0].question)
    assert_equal(answers, data[0].answers[0])
  end


  def test_should_find_1_record()
    database = Database.new("test_data/1_record.csv")
    database.read_all()

    result = database.find("robin")

    assert_equal(1, result.size())
  end


  def test_should_mark_1_record()
    database = Database.new("test_data/2_records.csv")
    database.read_all()

    database.mark("alma")

    result = database.find("alma")

    assert_equal(true, result[0].marked)
  end


  def test_should_write_all()
    $stdout, $stderr = STDOUT, STDERR
    database = Database.new("test_data/2_records.csv")
    database.read_all()
    database.mark("alma")

    test_filename = "test_data/2_records_written.csv"
    database.write_all(test_filename)

    database = Database.new(test_filename)
    database.read_all()
    result = database.find("alma")

    assert_equal(true, result[0].marked)
  end

end
