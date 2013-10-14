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
    current_user.jobs << @job
    redirect_to user_path(current_user)
  end
  
  def edit
    @job = Job.find(params[:id])
  end
  
  def update
    @job = Job.find(params[:id])
    if @job.update_attributes(params[:job])
      @job.update_attribute(:pay_amount, 25 * (@job.actual_hours * @job.workers))
      
      if current_user.role == "Worker"
        redirect_to user_path(current_user)
      else
        if current_user.stripe != nil
          redirect_to job_pay_path(@job)
        else
          redirect_to user_card_path(current_user)
        end
      end
      
    else
      render 'edit'
    end
  end
  
  def show
    @job = Job.find(params[:id])
  end
  
  def accept
    @job = Job.find(params[:job_id])
    current_user.jobs << @job
    @job.update_attribute(:accepted, true)
    redirect_to user_path(current_user) 
  end
  
end
