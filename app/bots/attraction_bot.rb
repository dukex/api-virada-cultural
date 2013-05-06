class AttractionBot
  def self.each(stage, &block)
    @stage = stage
    data.each do |item|
      yield ItemBot.new(item)
    end
  end

  def self.url
    "http://viradacultural.org/programacao/locais/#{@stage.location_slug}/?em_ajax=true&query=GlobalMapData"
  end

  def self.data
    JSON.parse open(url,"User-Agent" => "Dukes Bot" ).read
  end
end
