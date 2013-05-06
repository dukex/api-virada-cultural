class Stage
  include DataMapper::Resource

  has n, :attractions

  property :location_balloon, String
  property :location_state, String
  property :location_town, String
  property :location_address, String
  property :location_name, String
  property :location_slug, String
  property :blog_id, String
  property :post_id, String
  property :location_id, Integer, key: true
  property :location_postcode, String
  property :location_region, String
  property :location_country, String
  property :location_latitude, String
  property :location_longitude, String
  property :post_content, String
  property :location_owner, String
  property :location_status, String
end
