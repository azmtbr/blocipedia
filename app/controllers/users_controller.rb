class UsersController < ApplicationController

  def index
    @user = User.all
  end

  def show
    @user = current_user
    @wikis = @user.wikis.visible_to(current_user)
    @stripe_btn_data = {
     key: "#{ Rails.configuration.stripe[:publishable_key] }",
     description: "Premium membership - #{current_user.name}",
     amount: Amount.default
   }
  end

  def create
    @user = User.new
    @user.name = params[:user][:name]
    @user.email = params[:user][:email]

    @post.user = current_user
  end

  def downgrade
    current_user.update_attribute(:role, 'standard')
    flash[:notice] = "Your account has been downgraded to standard."
    redirect_to user_path(current_user)
  end


  private

  def user_params
    params.require(:user).permit(:email, :name)
  end


 end
