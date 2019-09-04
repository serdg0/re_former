class UsersController < ApplicationController
  def new

  end

  def create
    @user = User.new(users_params)
    if @user.save
      redirect_to new_user_path
    else
      render :new
    end
  end

  def users_params
    params.require(:user).permit(:name, :email, :password)
  end
end
