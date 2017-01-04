class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def redirect_paths
    {
      'manager' => manage_root_path,
      'user' => root_path
    }
  end

  def after_sign_in_path_for(resource)
    # if resource.role == 'manager'
    #   manage_root_path
    redirect_paths[redirect_paths.role]
  end
end
