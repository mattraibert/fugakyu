class AddGrainsToActivity < ActiveRecord::Migration
  def self.up
    add_column :activities, :grains, :integer
  end

  def self.down
    remove_column :activities, :grains
  end
end
