require 'csv'

load 'record.rb'

MULTI_ANSWER_DELIMITER = "-"

class Database

  QUESTION_COL = "question"

  ANSWER_COL = "answer"

  MARKED_COL = "marked"


  def initialize(filename)

    @filename = filename

  end


  def read_all()
    records = []

    CSV.foreach(@filename, :headers => true) do |csv_obj|

      if (csv_obj[MARKED_COL] == "true")
        marked = true
      else
        marked = false
      end

      records << Record.new(csv_obj[QUESTION_COL],
                            csv_obj[ANSWER_COL].split(MULTI_ANSWER_DELIMITER),
                            marked)

    end

    records

  end


  def write_all(data)

    data.foreach do |record|

      puts record

    end

  end

end