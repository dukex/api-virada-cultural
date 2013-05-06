class Attraction
  include DataMapper::Resource
  belongs_to :stage

  property :id, Serial
end
