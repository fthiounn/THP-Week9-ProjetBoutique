module ChargesHelper

		def totalprice
        @items.each do |i|
        @totalprice += ( i.price )
        end
        @totalprice = @order.totalprice
    end
    
end
