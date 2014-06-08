require 'pg'

ActiveRecord::Base.establish_connection(:adapter => "postgresql",
                                        :username => "postgres",
                                        :password => "",
                                        :database => "tagalog")