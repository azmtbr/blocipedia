class UsersController < ApplicationController

  def index
    @user = User.all
  end

  def show
    @user = current_user
  end

  def create
    @user = User.new
    @user.name = params[:user][:name]
    @user.email = params[:user][:email]

    @post.user = current_user
  end


  private

  def user_params
    params.require(:user).permit(:email, :name)
  end


 end
