class Activity < ActiveRecord::Base
  has_many :achievements
  def self.frequencies
    ["Daily", "Weekly", "Monthly", "Yearly"]
  end
end
