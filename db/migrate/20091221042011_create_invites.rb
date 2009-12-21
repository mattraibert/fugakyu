class CreateInvites < ActiveRecord::Migration
  def self.up
    create_table :invites do |t|
      t.string :key

      t.timestamps
    end
    Invite.new(:key => 'test').save
  end

  def self.down
    drop_table :invites
  end
end
