require 'test_helper'

class ActivityTest < ActiveSupport::TestCase

  test "activities with no achievements aren't done" do
    activity = Activity.new
    activity.achievements = []
    assert !activity.done?
  end

  test "Daily activities are done if achieved within a day" do
    activity = make_activity_achieved(Date.today)
    activity.frequency = "Daily"
    assert activity.done?
  end

  test "Daily activities aren't if achieved two days ago" do
    activity = make_activity_achieved(Date.today - 2.days)
    activity.frequency = "Daily"
    assert !activity.done?
  end

  test "Weekly activities are done if achieved within a Week" do
    activity = make_activity_achieved(Date.today - 2.days)
    activity.frequency = "Weekly"
    assert activity.done?
  end

  test "Weekly activities aren't done if not achieved recently" do
    activity = make_activity_achieved(Date.today - 10.days)
    activity.frequency = "Weekly"
    assert !activity.done?
  end

  test "Monthly activities are done if achieved within a Week" do
    activity = make_activity_achieved(Date.today - 2.days)
    activity.frequency = "Weekly"
    assert activity.done?
  end

  test "Monthly activities aren't done if not achieved recently" do
    activity = make_activity_achieved(Date.today - 10.days)
    activity.frequency = "Weekly"
    assert !activity.done?
  end

    test "Yearly activities are done if achieved within a Week" do
    activity = make_activity_achieved(Date.today - 2.days)
    activity.frequency = "Weekly"
    assert activity.done?
  end

  test "Yearly activities aren't done if not achieved recently" do
    activity = make_activity_achieved(Date.today - 10.days)
    activity.frequency = "Weekly"
    assert !activity.done?
  end

  test "2 Grains activities aren't done if not achieved twice" do
    activity = make_activity_achieved(Date.today)
    activity.frequency = "Daily"
    activity.grains = 2
    assert !activity.done?
  end

  test "2 Grains activities are done if achieved twice" do
    activity = make_activity_achieved(Date.today)
    activity.frequency = "Daily"
    activity.grains = 2
    achievement = Achievement.new(:date => Date.today)
    
    activity.achievements += [achievement]
    assert activity.done?
  end
  
  def make_activity_achieved(date)
    achievement = Achievement.new
    achievement.date = date
    activity = Activity.new
    activity.grains = 1
    activity.achievements = [achievement]
    activity
  end
end
