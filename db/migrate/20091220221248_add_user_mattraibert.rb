class AddUserMattraibert < ActiveRecord::Migration
  def self.up
    if !User.find_by_login('mattraibert')
      User.create(:login => 'mattraibert', 
                  :email => 'mattraibert@gmail.com', 
                  :password => 'mattraibert',
                  :password_confirmation => 'mattraibert')
    end
  end

  def self.down
  end
end
