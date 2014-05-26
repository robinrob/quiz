#!/usr/bin/env ruby

require 'optparse'
require 'optparse/time'
require 'ostruct'
require 'pp'
require 'colorize'

load 'pair_reader.rb'
load 'pair_selector.rb'
load 'pair.rb'
load 'game.rb'

options = OpenStruct.new
options.times = 1
options.guesses = 1

opt_parser = OptionParser.new do |opts|
  opts.banner = "Usage: options.rb [options]"

  opts.separator ""
  opts.separator "Specific options:"

  # Mandatory argument.
  opts.on("-f", "--filename [CSV TRANSLATIONS FILE]",
          "Specify input CSV file with Tagalog -> English translations.") do |val|
    options.filename = val
  end

  # Mandatory argument.
  opts.on("-t", "--times [NUMBER OF TIMES]",
          "Specify number of times.") do |val|
    options.times = val.to_i
  end

  # Mandatory argument.
  opts.on("-g", "--guesses [NUMBER OF GUESSES PER GO]",
          "Specify number of guesses.") do |val|
    options.guesses = val.to_i
  end
end

opt_parser.parse(ARGV)

pairs = PairReader.new().read(options.filename)

selector = PairSelector.new(pairs)

Game.new(selector).play(options.times, options.guesses)
