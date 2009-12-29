class TodoController < ApplicationController
  
  before_filter :login_required
  
  def index
    @activities = todo_list

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @activities }
    end
  end
  
  def todo_list
    by_frequency = @current_user.activities
    
    by_frequency.select { |activity| !activity.done? }
  end
end
