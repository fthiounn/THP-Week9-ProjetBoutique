module ApplicationHelper
	
	def current_cart_id
		Cart.where(user_id: current_user.id).id
	end

	def current_cart_id
    Cart.where(user_id: current_user.id).first.id
    end

	def totalprice
        @items.each_with_index do |i|
            @totalprice += ( i.price * i.quantity )
        end
        @totalprice = @order.totalprice
    end


end
