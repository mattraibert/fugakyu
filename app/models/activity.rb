class Activity < ActiveRecord::Base
  has_many :achievements
  belongs_to :user

  named_scope :by_frequency, lambda { |frequency|
    { :conditions => { :frequency => frequency } }
  }

  def done?
    self.achievements.any? {|achievement| self.recent?(achievement.date) }
  end

  def recent?(date)
    #TODO probably should use polymorphism on some kind of frequency objects
    self.send(self.frequency + "_recent", date)
  end

  def Daily_recent(date)
    date > Date.today - 1.day
  end

  def Weekly_recent(date)
    date > Date.today - 1.week
  end
  
  def Monthly_recent(date)
    date > Date.today - 1.month
  end
  
  def Yearly_recent(date)
    date > Date.today - 1.year
  end
  
  def self.frequencies
    ["Daily", "Weekly", "Monthly", "Yearly"]
  end
  
  def self.grain_values
    [1, 2, 3, 4]
  end
end

