class CartItem < ApplicationRecord
	belongs_to :customer
	belongs_to :product
	def subtotal
		self.count * self.product.tax_includ
	end
end
