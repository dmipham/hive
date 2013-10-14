class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    if current_user.role == "Worker"
      edit_user_path(current_user)
    else
      user_card_path(current_user)
    end
  end
  
end
