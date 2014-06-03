class Selector

  def initialize(items)

    @items = items
    @marked_items = find_marked(items)

  end


  def select
    select_item(@items)
  end


  def select_marked()
    select_item(@marked_items)
  end


  def select_item(items)
    items[Random.rand(items.size())]
  end


  def find_marked(items)
    marked_items = []

    items.each do |item|

      marked_items << item if item.marked

    end

    marked_items

  end

end
