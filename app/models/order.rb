class Order < ApplicationRecord
	has_many :ordered_products, dependent: :destroy
	belongs_to :customer

	def total_price
		order.billing_amount - order.postage
	end
end
