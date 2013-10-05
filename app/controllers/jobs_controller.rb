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
    redirect_to user_path(current_user)
  end
  
  def edit
    @job = Job.find(params[:id])
  end
  
  def update
    @job = Job.find(params[:id])
    if @job.update_attributes(params[:job])
      @job.update_attribute(:pay_amount, 25 * (@job.actual_hours * @job.workers))
     redirect_to user_path(current_user) if current_user.role == "Worker"
     redirect_to job_pay_path(@job) if current_user.role == "Keeper"
    else
      render 'edit'
    end
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
