class PGDatabase

  @conn = ActiveRecord::Base.establish_connection(:adapter => "postgresql",
                                                 :username => "msl",
                                                 :password => "",
                                                 :database => "quiz").connection()

  def conn()
    @conn
  end

end



  #def initialize()
  #  require 'pg'
  #  require 'active_record'
  #
  #
  #
  #
  #  puts conn
  #
  #  puts "database: " + conn.current_database
  #
  #  puts "rows:"
  #  result = conn.query('select * from questions')
  #  puts result
  #
  #  #str = 'insert into questions ("id", "question","answer") values (DEFAULT, \'robin\',\'smith\')'
  #  #puts str
  #  #
  #  #result = conn.query(str);
  #  #
  #  #puts result.inspect
  #end