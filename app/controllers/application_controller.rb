class ApplicationController < ActionController::Base
   include Pundit

   protect_from_forgery with: :exception
   before_action :configure_permitted_parameters, if: :devise_controller?

  # after_action :verify_authorized, except: :index
  #  unless devise_controller?
  #    after_action :verify_policy_scoped, only: :index
  #  end

   rescue_from Pundit::NotAuthorizedError do |exception|
     redirect_to root_url, alert: exception.message
   end


   private

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end
end
