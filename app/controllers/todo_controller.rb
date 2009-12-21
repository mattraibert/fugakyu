class TodoController < ApplicationController
  
  before_filter :login_required

  def index
    @frequency = params[:frequency]
    @user = self.current_user

    @activities = @user.activities.by_frequency(@frequency)
    
    todays_activities = @user.achievements.today.map { |achievement| 
      achievement.activity 
    }

    @activities = @activities - todays_activities
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @activities }
    end
  end
end
