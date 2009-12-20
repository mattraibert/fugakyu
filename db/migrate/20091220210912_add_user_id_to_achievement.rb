class AddUserIdToAchievement < ActiveRecord::Migration
  def self.up
    add_column :achievements, :user_id, :integer
    existing_achievements = Achievement.find_all_by_user_id(nil)
    existing_achievements.each do |achievement|
      achievement.user = User.find_by_login 'mattraibert'
      achievement.save
    end
  end

  def self.down
    remove_column :achievements, :user_id
  end
end
