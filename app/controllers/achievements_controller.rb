class AchievementsController < ApplicationController
  # GET /achievements
  # GET /achievements.xml
  before_filter :login_required

  def index
    @achievements = self.current_user.achievements

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @achievements }
    end
  end

  # GET /achievements/1
  # GET /achievements/1.xml
  def show
    @achievement = Achievement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @achievement }
    end
  end

  # GET /achievements/new
  # GET /achievements/new.xml
  def new
    @activity = Activity.find(params[:activity_id])
    @achievement = Achievement.new(:activity => @activity, 
                                   :date => Date.today,
                                   :user => self.current_user)
    @achievement.save
    redirect_to(todo_path(@activity.frequency))
  end

  # GET /achievements/1/edit
  def edit
    @achievement = Achievement.find(params[:id])
  end

  # POST /achievements
  # POST /achievements.xml
#  def create
#    @achievement = Achievement.new(params[:achievement])
#    
#    respond_to do |format|
#      if @achievement.save
#        flash[:notice] = 'Achievement was successfully created.'
#        format.html { redirect_to(todo_path(@activity.frequency)) }
#        format.xml  { render :xml => @achievement, :status => :created, :location => @achievement }
#      else
#        format.html { redirect_to(todo_path(@activity.frequency)) }
#
#        format.xml  { render :xml => @achievement.errors, :status => :unprocessable_entity }
#     end
#   end
# end

  # PUT /achievements/1
  # PUT /achievements/1.xml
  def update
    @achievement = Achievement.find(params[:id])

    respond_to do |format|
      if @achievement.update_attributes(params[:achievement])
        flash[:notice] = 'Achievement was successfully updated.'
        format.html { redirect_to(@achievement) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @achievement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /achievements/1
  # DELETE /achievements/1.xml
  def destroy
    @achievement = Achievement.find(params[:id])
    @achievement.destroy

    respond_to do |format|
      format.html { redirect_to(achievements_url) }
      format.xml  { head :ok }
    end
  end
end
