class AttractionBot
  def self.each(stage, &block)
    @stage = stage
    data.each do |item|
      yield AttractionItemBot.new(item)
    end
  end

  def self.url
    "http://viradacultural.org/wp-admin/admin-ajax.php?action=get_events_location&location_id=#{@stage.id}&_wpnonce=fe91212660"
  end

  def self.data
    response = RestClient.post(url, {})
    html = JSON.parse(response.body)['html']
    parser = Nokogiri::HTML(html)
    items = []
    days = parser.search('.holder-list')

    saturday = days[0]
    sunday = days[1]

    get_items_day(saturday).each{ |item| items << ['saturday', item] }
    get_items_day(sunday).each{ |item| items << ['sunday', item] }

    items
  end

def self.get_items_day(day)
  return [] if day.nil?
  items = []
  day.search('p:nth-child(n+2)').each_slice(2) do |item|
    items << item
  end
  items
end

end
class AttractionItemBot < ItemBot
  def url
    'http://viradacultural.org/wp-admin/admin-ajax.php'
  end

  def initialize(item)
    @item = {}
    day, item_data = item
    hour_minutes = item_data[0].text
    hour, minutes = hour_minutes.split('h').map(&:to_i)

    id = item_data[1].search('a').attribute('rel').value

    @item['link'] = item_data[1].search('a').attribute('href').value
    @item['id'] = id.to_s

    response = RestClient.post(url, {event_id: id, action: "get_event_ajax"})
    html = JSON.parse(response.body)['html']
    parser = Nokogiri::HTML(html)

    @item['title'] = parser.search('h3').text
    @item['description'] = parser.search('.desc-atracao').text

    starts_at = Time.new(2013, 5, day == 'saturday' ? 18 : 19, hour, minutes, 0, "-03:00")
    @item['starts_at'] = starts_at
  end
end
