class UsersController < ApplicationController
  def new

  end

  def create
    @user = User.new(user: params[:user][:name], email: params[:user][:email],
                     password: [:user][:password])
    if @user.save
      redirect_to new_user_path
    else
      render :new
    end
  end
end
