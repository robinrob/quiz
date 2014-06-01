class Database

  def initialize(filename)

    @filename = filename

  end


  def read_all()
    CSV.foreach(@filename, :headers => true) do |csv_obj|

      pairs << Pair.new(csv_obj['Question'], csv_obj['Answer'])

    end

  end

end