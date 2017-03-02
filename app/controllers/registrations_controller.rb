class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(user)
    users_show_profile_path(user)
  end
end
