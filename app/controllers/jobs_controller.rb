class JobsController < ApplicationController
  
  def new
    @job = Job.new
  end
  
  def create
    @job = Job.create(params[:job])
    redirect_to root_path
  end
  
end
