class UsersController < ApplicationController

  def index
    @user = User.all
  end

  def show
    @user = current_user
  end


  private

  def user_params
    params.require(:user).permit(:email)
  end


 end
