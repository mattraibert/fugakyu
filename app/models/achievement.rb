class Achievement < ActiveRecord::Base
  belongs_to :activity
  belongs_to :user
  
  named_scope :today, lambda { 
    { :conditions => { :date => 1.day.ago..Date.today } } 
  }
end
