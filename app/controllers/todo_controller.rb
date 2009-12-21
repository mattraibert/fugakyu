class TodoController < ApplicationController
  
  before_filter :login_required

  def index
    @frequency = params[:frequency]

    @activities = self.current_user.activities.by_frequency(@frequency)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @activities }
    end
  end
end
