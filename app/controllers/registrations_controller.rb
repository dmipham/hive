class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    if current_user.role == "Worker"
      edit_user_path(current_user)
    else
      job_pay_path(params[:job_id])
    end
  end
  
end
