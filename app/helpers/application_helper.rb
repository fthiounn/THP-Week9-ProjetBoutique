module ApplicationHelper

  def current_cart
    Cart.where(user_id: current_user.id).first
  end

  def number_to_euro(amount)
    number_to_currency(amount,locale: :fr)
  end
  
	def current_cart_id
    Cart.where(user_id: current_user.id).first.id
  end
end
