class CreateAchievements < ActiveRecord::Migration
  def self.up
    create_table :achievements do |t|
      t.integer :activity_id
      t.date :date
      t.string :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :achievements
  end
end
