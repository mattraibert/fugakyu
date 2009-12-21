class Activity < ActiveRecord::Base
  has_many :achievements
  belongs_to :user

  named_scope :by_frequency, lambda { |frequency|
    { :conditions => { :frequency => frequency } }
  }

  def self.frequencies
    ["Daily", "Weekly", "Monthly", "Yearly"]
  end
end
