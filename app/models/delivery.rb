class Delivery < ApplicationRecord
	belongs_to :customer
	def order_address
		self.postcode + self.adddress + self.name
	end
end
