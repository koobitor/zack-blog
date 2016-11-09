class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = 'Profile Updated'
      redirect_to edit_profile_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :avatar)
  end
end
