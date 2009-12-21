class AddTenInvites < ActiveRecord::Migration
  def self.up
    ["salmon", "yellowtail", "tuna", "whitefish", "herring",
    "trout","cod","starfish","gefilte","seahorse"].each do |fish|
      Invite.new(:key => fish).save
    end
  end

  def self.down
  end
end
