require 'pg'
require 'active_record'
require 'csv'

load 'question.rb'

class PGDatabase

  QUESTIONS_TABLE = "questions"

  ID_COL = "id"

  QUESTION_COL = "question"

  ANSWER_COL = "answers"

  MARKED_COL = "marked"

  SCORE_COL = "score"

  MULTI_ANSWER_DELIMITER = "-"


  @@conn = ActiveRecord::Base.establish_connection(:adapter => "postgresql",
                                                  :username => "msl",
                                                  :password => "",
                                                  :database => "quiz").connection()

  def conn
    @@conn
  end

  self.init()


  def self.init()
    self._drop
    self._create
    self._populate
  end


  def self._drop()
    @conn.query('drop table questions;')
  end


  def self._create()
    @conn.query("CREATE TABLE #{QUESTIONS_TABLE} (
                 #{ID_COL} 			 serial PRIMARY KEY,
                 #{QUESTION_COL} varchar(100) UNIQUE NOT NULL,
                 #{ANSWERS_COL}  varchar(100) NOT NULL,
                 #{MARKED_COL}   boolean NOT NULL DEFAULT FALSE,
                 #{SCORE_COL}		 integer NOT NULL DEFAULT 0
                );")
  end


  def self._populate()
    self._insert_all(self._read_records())
  end


  def self._read_records()
    records = []

    CSV.foreach("tagalog.csv", :headers => true) do |csv_obj|

      if (csv_obj[MARKED_COL] == "true")
        marked = true
      else
        marked = false
      end

      headers = csv_obj.headers

      records << Question.new(question=csv_obj[QUESTION_COL],
                            answer=csv_obj[ANSWER_COL].split(MULTI_ANSWER_DELIMITER),
                            marked=marked,
                            score=csv_obj[SCORE_COL])

    end

    records
  end


  def self._insert_all(records)
    records.each do |record|
      record.save()
    end
  end

end