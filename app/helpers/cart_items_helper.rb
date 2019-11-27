module CartItemsHelper
		def current_cart_id
		Cart.where(user_id: current_user.id).id
	end
end
