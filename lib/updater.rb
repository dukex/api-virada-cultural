require 'bots'
require 'models'

class Updater
  def self.now
    StageBot.each do |stage_bot|
      unless stage = Stage.get(stage_bot.location_id)
        stage = Stage.create! stage_bot.attributes_to_create
      end
      stage.update! stage_bot.attributes_to_update

      AttractionBot.each(stage) do |attraction_bot|
        unless attraction = Attraction.get(attraction_bot.id)
          stage.attractions.create! attraction_bot.attributes_to_create
        else
          attraction.update! attraction_bot.attributes_to_update
        end
      end
    end
  end
end
