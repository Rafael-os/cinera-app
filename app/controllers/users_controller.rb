class UsersController < ApplicationController
  before_action :set_user, only: [:follow, :unfollow, :show]

  def show
  end

  def follow
    if current_user.follow(@user.id)
      redirect_to @user
    end
  end

  def unfollow
    if current_user.unfollow(@user.id)
      redirect_to @user
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:photo)
  end
end
