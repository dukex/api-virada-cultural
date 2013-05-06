class Attraction
  include DataMapper::Resource
  belongs_to :stage

  property :id, Serial
  property :title, String
  property :description, Text
  property :link, String
  property :starts_at, DateTime

  def stage_url
    "http://api.viradacultural.vertigem.xxx/stages/#{self.stage_id}"
  end

  def attraction_stage_url
    "http://api.viradacultural.vertigem.xxx/stages/#{self.stage_id}/attractions/#{self.id}"
  end
end
