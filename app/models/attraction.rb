class Attraction
  include DataMapper::Resource
  belongs_to :stage

  property :id, Serial
  property :title, String
  property :description, Text
  property :link, String
  property :starts_at, DateTime

end
