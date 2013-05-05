class StageBot
  URL_BASE = "http://viradacultural.org/programacao?em_ajax=true&query=GlobalMapData"

  def self.each(&block)
    data.each do |item|
      yield StageBotItem.new(item)
    end
  end

  def self.url
    URL_BASE
  end

  def self.data
    JSON.parse open(url,"User-Agent" => "Dukes Bot" ).read
  end
end


class StageBotItem
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
