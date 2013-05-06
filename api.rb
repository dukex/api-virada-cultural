require 'bundler'
Bundler.require

lib_dir = File.expand_path('../lib', __FILE__)
$:.unshift lib_dir unless $:.include?(lib_dir)

require 'models'
require 'entities'
require 'grape_hack'

class API < Grape::API
  format :json

  resources :stages do
    get do
      Stage.all
    end

    get ':id' do
      stage = Stage.get(params[:id])
      present stage, with: Entities::Stage
    end
  end

  resources :attractions do
    get do
      Attraction.all
    end

    get ':id' do
      Attraction.get(params[:id])
    end
  end
end
