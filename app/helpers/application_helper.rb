module ApplicationHelper
	def total_price(cart_items)
		price = 0
		cart_items.each do |cart_item|
			price += cart_item.subtotal
		end
		return price
	end
end
