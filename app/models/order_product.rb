class OrderProduct < ApplicationRecord
	belongs_to :order
	belongs_to :product

	def subtotal
		(self.product.price * self.count * 1.1).floor
	end
	enum production_status: {着手不可: 1, 製作待ち: 2, 製作中: 3, 製作完了: 4}
end
