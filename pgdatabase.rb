require 'pg'
require 'active_record'

ActiveRecord::Base.establish_connection(:adapter => "postgresql",
                                        :username => "postgres",
                                        :password => "",
                                        :database => "tagalog")