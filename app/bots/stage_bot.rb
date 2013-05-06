class StageBot
  URL_BASE = "http://viradacultural.org/programacao?em_ajax=true&query=GlobalMapData"

  def self.each(&block)
    data.each do |item|
      yield ItemBot.new(item)
    end
  end

  def self.url
    URL_BASE
  end

  def self.data
    JSON.parse open(url,"User-Agent" => "Dukes Bot" ).read
  end
end
