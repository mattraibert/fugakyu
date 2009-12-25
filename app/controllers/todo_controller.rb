class TodoController < ApplicationController
  
  before_filter :login_required
  
  def index
    @frequency = self.frequency
    @activities = todo_for(self.frequency)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @activities }
    end
  end
  
  def todo_for(frequency)
    by_frequency = @current_user.activities.by_frequency(frequency)
    
    by_frequency.select { |activity| !activity.done? }
  end
end
