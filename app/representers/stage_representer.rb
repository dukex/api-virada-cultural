module StageRepresenter
  include Roar::Representer::JSON
  include Roar::Representer::Feature::Hypermedia

  property :location_state
  property :location_town
  property :location_name
  property :location_slug
  property :blog_id
  property :post_id
  property :location_id
  property :location_postcode
  property :location_region
  property :location_country
  property :location_latitude
  property :location_longitude
  property :location_owner
  property :location_status
  property :attractions


  link :self do
    stage_url
  end

  link :attractions do
    attractions_stage_url
  end
end
