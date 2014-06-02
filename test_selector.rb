require "test/unit"

load "database.rb"


class TestDatabase < Test::Unit::TestCase

  def should_read(filename)

    data = Database.new(filename).read_all()

    assert_equal(1, data.size())
  end


  def test_should_read_1_record()
    $stdout, $stderr = STDOUT, STDERR

    puts "hello"

    should_read('test_data/1_record.csv')
  end


  def test_should_read_3_records()
    $stdout, $stderr = STDOUT, STDERR

    puts "hello"

    should_read('test_data/3_records.csv')
  end

end