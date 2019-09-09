# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
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

  def update
    @user = User.find(params[:id])
    if @user.update(users_params)
      flash[:success] = 'Profile Updated Successfully!'
    else
      render 'edit'
    end
  end

  private

  def users_params
    params.require(:user).permit(:name, :email, :password)
  end
end
