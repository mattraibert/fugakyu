class DefaultGrainsValue < ActiveRecord::Migration
  def self.up
    Activity.all.each do |activity|
      activity.grains = 1
    end
  end

  def self.down
  end
end
