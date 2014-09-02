#!/usr/bin/env ruby

load 'pgdatabase.rb'
load 'question.rb'

# str = "'Robin'"
# puts str.gsub(/'/){ "\\'" }

# conn = PGDatabase.conn
# 
# puts "database: " + conn.current_database
# 
# puts "rows:"
# result = conn.query('select * from questions')
# puts result.inspect()
# 
# puts "records:"
# puts Question.all.inspect()
# 
# str = 'insert into questions ("id", "question","answer") values (DEFAULT, \'robin\',\'smith\')'
# puts str
# 
# result = conn.query(str);
# 
# puts result.inspect