class Order < ApplicationRecord
	has_many :order_products, dependent: :destroy
	belongs_to :customer
	enum payment:{クレジットカード: 1, 銀行振込: 2}
	enum order_status: {入金待ち: 1, 入金確認: 2, 製作中: 3, 発送準備中: 4, 発送済み: 5}
	def total_price
		self.billing_amount - self.postage
	end
	def full_address
		self.postcode + self.address + self.name
	end
end
