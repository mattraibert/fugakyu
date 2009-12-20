class AddUserIdToActivity < ActiveRecord::Migration
  def self.up
    add_column :activities, :user_id, :integer
    existing_activities = Activity.find_all_by_user_id(nil)
    existing_activities.each do |activity|
      activity.user = User.find_by_login 'mattraibert'
      activity.save
    end
  end

  def self.down
    remove_column :activities, :user_id
  end
end
