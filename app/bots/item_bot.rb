class ItemBot
  def initialize(item)
    @item = item
  end

  def attributes_to_create
    @item.dup
  end

  def attributes_to_update
    attributes = attributes_to_create
    attributes.delete('location_id')
    attributes
  end

  def method_missing(m, *args, &block)
    return @item["#{m}"] if @item["#{m}"]
    super
  end
end
