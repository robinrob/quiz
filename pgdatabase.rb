require 'pg'
require 'active_record'
require 'csv'

load 'record.rb'

class PGDatabase

  QUESTION_COL = "question"

  ANSWER_COL = "answer"

  MARKED_COL = "marked"

  SCORE_COL = "score"

  MULTI_ANSWER_DELIMITER = "-"


  def self.init()
    self._drop
    self._create
    self._populate
  end


  def self._drop()
    @conn.query('drop table questions;')
  end


  def self._create()
    @conn.query('CREATE TABLE questions (
                 id 				     serial PRIMARY KEY,
                 question        varchar(100) UNIQUE NOT NULL,
                 answer		       varchar(100) NOT NULL,
                 marked          boolean NOT NULL DEFAULT FALSE,
                 score		       integer NOT NULL DEFAULT 0
                );')
  end


  def self._populate()
    records = []

    CSV.foreach("tagalog.csv", :headers => true) do |csv_obj|

      if (csv_obj[MARKED_COL] == "true")
        marked = true
      else
        marked = false
      end

      headers = csv_obj.headers

      records << Record.new(question=csv_obj[QUESTION_COL],
                          answer=csv_obj[ANSWER_COL].split(MULTI_ANSWER_DELIMITER),
                          marked=marked,
                          score=csv_obj[SCORE_COL])

    end

    self._insert_all(records)
  end


  def self._insert_all(records)
    records.each do |record|
      self._insert(record)
    end
  end


  def self._insert(record)
    question = record.question.gsub(/'/){ "''" }
    answers = record.answers.join(MULTI_ANSWER_DELIMITER).gsub(/'/){ "''" }

    values = "values (\'#{question}\',\'#{answers}\',\'#{record.marked}\',\'#{record.score}\')"
    query = "insert into questions (question,answer,marked,score) #{values};"

    @conn.query(query)
  end


  @conn = ActiveRecord::Base.establish_connection(:adapter => "postgresql",
                                                  :username => "msl",
                                                  :password => "",
                                                  :database => "quiz").connection()

  def self.conn
    @conn
  end

  self.init()
end