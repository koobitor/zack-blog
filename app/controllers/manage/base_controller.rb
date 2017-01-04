module Manage
    class BaseController < ApplicationController
       before_action :ensure_user_is_manager!

       def ensure_user_is_manager!
           redirect_to root_path unless current_user&.role == 'manager'
       end 
    end
end