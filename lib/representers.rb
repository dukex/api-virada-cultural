entities_path = File.expand_path('../../app/representers', __FILE__)
$:.unshift entities_path unless $:.include?(entities_path)

require 'roar/representer/json'
require 'roar/representer/feature/hypermedia'

require 'stage_representer'
require 'attraction_representer'
