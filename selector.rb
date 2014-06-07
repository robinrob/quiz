class Selector

  def initialize(items)

    @items = items
    @marked_items = []
    @unmarked_items = []
    _populate_marked_items(items)
    @counter = 0

  end


  def select
    select_item(@items)
  end


  def select_unmarked()
    select_item(@marked_items)
  end


  def select_marked()
    select_item(@marked_items)
  end


  def select_marked_rate(rate)
    @counter = (@counter + rate).round(2)

    if @counter < 1
      record = select()
    else
      record = select_marked()
    end

    record

  end


  def select_item(items)
    items[Random.rand(items.size())]
  end


  def _populate_marked_items(items)
    items.each do |item|

      if item.marked
        @marked_items << item
      else
        @unmarked_items << item
      end

    end

  end

end
