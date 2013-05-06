bots_path = File.expand_path('../../app/bots', __FILE__)
$:.unshift bots_path unless $:.include?(bots_path)

require 'open-uri'
require 'item_bot'
require 'stage_bot'
require 'attraction_bot'
