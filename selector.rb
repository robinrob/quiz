class Selector

  def initialize(items)

    @items = items
    @marked_items = []
    @unmarked_items = []
    _populate_marked_items(items)

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
