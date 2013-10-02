class UsersController < ApplicationController
  
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
  end
  
end
