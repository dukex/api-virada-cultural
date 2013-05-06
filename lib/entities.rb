entities_path = File.expand_path('../../app/entities', __FILE__)
$:.unshift entities_path unless $:.include?(entities_path)

require 'stage_entity'
