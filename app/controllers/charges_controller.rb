class ChargesController < ApplicationController
  def new
    @stripe_btn_data = {
     key: "#{ Rails.configuration.stripe[:publishable_key] }",
     description: "Premium membership - #{current_user.name}",
     amount: Amount.default
   }
  end

  def create


   customer = Stripe::Customer.create(
     email: current_user.email,
     card: params[:stripeToken]
   )

   # Where the real magic happens
   charge = Stripe::Charge.create(
     customer: customer.id, # Note -- this is NOT the user_id in your app
     amount: 2500,
     description: "Premium Membership - #{current_user.email}",
     currency: 'usd'
   )

   current_user.update_attribute(:role, 'premium')
   flash[:notice] = "Thanks the money, #{current_user.email}! Enjoy your Premium membership."
   redirect_to user_path(current_user) # or wherever

 # Stripe will send back CardErrors, with friendly messages
 # when something goes wrong.
 # This `rescue block` catches and displays those errors.
 rescue Stripe::CardError => e
   flash[:error] = e.message
   redirect_to new_charge_path
  end
end
