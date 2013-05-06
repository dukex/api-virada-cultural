module AttractionRepresenter
  include Roar::Representer::JSON
  include Roar::Representer::Feature::Hypermedia

  property :id
  property :title
  property :description
  property :link
  property :starts_at
  property :stage_id


  link :self do
    attraction_stage_url
  end

  link :stage do
    stage_url
  end
end



