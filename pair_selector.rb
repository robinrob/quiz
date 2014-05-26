load 'pair.rb'

class PairSelector

  def initialize(pairs)
    @pairs = pairs
  end

  def select
    choice = @pairs[Random.rand(@pairs.size())]
    choice
  end

end
