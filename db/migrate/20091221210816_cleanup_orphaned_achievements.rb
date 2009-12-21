class CleanupOrphanedAchievements < ActiveRecord::Migration
  def self.up
    Achievement.all.each do |achievement|
      unless achievement.activity
        achievement.destroy
      end  
    end
      
  end

  def self.down
  end
end
