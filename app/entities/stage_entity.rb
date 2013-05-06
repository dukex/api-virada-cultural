module Entities
  class Stage < Grape::Entity
    expose :id, :location_state, :location_town, :location_name, :location_slug, :blog_id, :post_id, :location_id, :location_postcode, :location_region, :location_country, :location_latitude, :location_longitude, :location_owner, :location_status, :attractions
  end
end
