module CartsHelper

	def totalprice(items)
		@totalprice = 0
		items.each do |i|
		    puts "$$$$$$$$$$$$$" * 100
		    puts i.price
		    puts "$$$$$$$$$$$$$" * 100
			@totalprice += ( i.price )
		end
		return @totalprice
	end
end
