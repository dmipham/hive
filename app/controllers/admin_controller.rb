class AdminController < ApplicationController
  
  before_filter :authenticate_user!
  
  def index
    
    @users = User.all
    
    @worker_bees = User.where("role = ?", "Worker")
    @pending_wb = @worker_bees.where("approved = ?", false)
    
    @beekeepers = User.where("role = ?", "Keeper")
    
    hours_worked = Job.pluck(:actual_hours).reject!(&:nil?)
    
    @total_hours = hours_worked.empty? ? 0 : hours_worked.inject(:+)
    @total_revenue = @total_hours * 25
    
    
  end
  
  def approve
    
    @user = User.find(params[:user_id])
    
    @user.update_attribute(:approved, true)
    redirect_to :back, flash: { :success => "Worker Bee successfully approved" }
    
  end
  
end
