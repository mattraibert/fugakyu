class Activity < ActiveRecord::Base
  has_many :achievements
  belongs_to :user
  def self.frequencies
    ["Daily", "Weekly", "Monthly", "Yearly"]
  end
end
