#!/usr/bin/env ruby

require 'csv'


class PairReader

  def read(filename)
    pairs = []

    CSV.foreach(filename, :headers => true) do |csv_obj|

      pairs << Pair.new(csv_obj['Tagalog'], csv_obj['English'])

    end

    pairs

  end

end
