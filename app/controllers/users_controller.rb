class UsersController < ApplicationController
  def new
    @user = User.new(name:"", email: "",password:"")
  end

  def create
    @user = User.new(users_params)
    if @user.save
      redirect_to new_user_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  private

  def users_params
    params.require(:user).permit(:name, :email, :password)
  end
end
