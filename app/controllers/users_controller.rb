class UsersController < ApplicationController
  
  before_filter :authenticate_user!
  
  def index
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
  end
  
  def show
    
    @user = current_user
    
    @new_job = Job.new
    
    # Beekeepers
    @completed_work = current_user.jobs.where("date_time < ?", Date.today).where("accepted = ?", true)
    
    @scheduled_work = current_user.jobs.where("date_time > ?", Date.today)
    
    # Worker Bees
    
    @active_jobs = current_user.jobs.where("date_time > ?", Date.today).where("accepted = ?", true)
    
    @work_history = current_user.jobs.where("date_time < ?", Date.today)
    
    @opportunities = Job.where("date_time > ?", Date.today).where("accepted = ?", false)
    
    
  end
  
end
