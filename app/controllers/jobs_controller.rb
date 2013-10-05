class JobsController < ApplicationController
  
  before_filter :authenticate_user!
  
  def index
    @jobs = current_user.jobs.all
  end
 
  def new
    @job = Job.new
  end
  
  def create
    @job = Job.create(params[:job])
    current_user.update_attribute(:job_id, @job.id)
    redirect_to root_path
  end
  
  def show
  end
  
  def accept
    @job = Job.find(params[:job_id])
    @job.update_attribute(:worker_id, current_user[:id])
    @job.update_attribute(:accepted, true)
    redirect_to user_path(current_user) 
  end
  
end
