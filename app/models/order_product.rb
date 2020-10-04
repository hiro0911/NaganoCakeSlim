class OrderProduct < ApplicationRecord
	belongs_to :order
	belongs_to :product

	def subtotal
		self.price * self.count
	end
end
