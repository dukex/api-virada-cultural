require 'bots'
require 'models'

class Updater
  def self.now
    StageBot.each do |stage_bot|
      if stage = Stage.get(stage_bot.location_id)
         stage.update! stage_bot.attributes_to_update
      else
        Stage.create! stage_bot.attributes_to_create
      end
    end
  end
end
