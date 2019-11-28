class ChargesController < ApplicationController

  before_action :authenticate_user!


  def new
    @totalprice = params[:totalprice].to_i
    @amount = @totalprice
  end

 def create
    @token = params[:stripeToken]
    redirect_to new_order_path(event: @event,token: @token)
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
  end          

end 
