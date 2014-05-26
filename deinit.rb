#!/usr/bin/env ruby

def deinit_all()
  
  CSV.foreach("repos.csv", :headers => true) do |csv_obj|
  
    deinit(csv_obj['Repo'])
    
  end
  
  system("rm .gitmodules")
  system("rm -rf .git/modules/")
  
end


def deinit(repo)
  system("sudo rm -rf #{repo}")
  system("git rm -r --cached #{repo}")
  system("git submodule deinit #{repo}")
  system("rm -rf .git/modules/#{repo}}")
end


require 'csv'

if ARGV.size() == 2
  repo = ARGV[1]
else
  deinit_all()
end


