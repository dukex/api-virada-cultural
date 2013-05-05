models_path = File.expand_path('../../app/models', __FILE__)
$:.unshift models_path unless $:.include?(models_path)

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, ENV['DATABASE_URL']||"sqlite3://#{Dir.pwd}/database.sqlite3")

require 'stage'

DataMapper.finalize
DataMapper.auto_upgrade!
