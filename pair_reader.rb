require 'csv'


class PairReader

  def read(filename)
    pairs = []

    CSV.foreach(filename, :headers => true) do |csv_obj|

      pairs << Pair.new(csv_obj['Question'], csv_obj['Answer'])

    end

    pairs

  end

end
