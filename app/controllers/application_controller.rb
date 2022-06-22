class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    return account_root_path if resource.is_a?(User)
    return manager_root_path if resource.is_a?(Admin)
  end

  def after_sign_out_path_for(resource)
    return new_user_session_path if resource == :user
    return new_admin_session_path if resource == :admin
  end
end
