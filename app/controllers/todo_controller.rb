class TodoController < ApplicationController
  
  before_filter :login_required

  def index
    @activities = Activity.find_all_by_frequency(params[:frequency])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @activities }
    end
  end
end
