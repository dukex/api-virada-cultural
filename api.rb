require 'bundler'
Bundler.require

lib_dir = File.expand_path('../lib', __FILE__)
$:.unshift lib_dir unless $:.include?(lib_dir)

require 'representers'
require 'models'
require 'grape_hack'

class API < Grape::API
  format :json

  helpers do
    def expose(resource, representer)
      return resource.map{|r| r.extend representer } if resource.is_a?(DataMapper::Collection)
      resource.extend representer
    end
  end

  resources :stages do
    get do
      expose Stage.all, StageRepresenter
    end

    get ':id' do
      expose Stage.get(params[:id]), StageRepresenter
    end

    get ':stage_id/attractions' do
      conditions = {}
      conditions[:title.like] = "%#{params[:title]}%" if params[:title]
      conditions[:description.like] = "%#{params[:description]}%" if params[:description]
      conditions[:stage_id] = params[:stage_id]

      expose Attraction.all(conditions: conditions), AttractionRepresenter
    end

    get ':stage_id/attractions/:id' do
      expose Attraction.get(params[:id]), AttractionRepresenter
    end
  end

  resources :attractions do
    get do
      expose attraction = Attraction.all, AttractionRepresenter
    end
  end
end
