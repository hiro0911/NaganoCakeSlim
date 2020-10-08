class OrdersController < ApplicationController
	def new
		@order = Order.new
		@deliveries = Delivery.where(customer_id: current_customer.id)
	end
	def confirm
		@cart_items = CartItem.where(customer_id: current_customer.id)
		@order = Order.new(customer_id: current_customer.id,
											 payment: params[:payment],
											 postage: 800)
		if params[:addresses] == "ご自身の住所"
			@order.postcode = current_customer.postcode
			@order.address = current_customer.address
			@order.name = current_customer.full_name_kanji
		elsif params[:addresses] == "登録住所から選択"
			@delivery = Delivery.find(params[:delivery_id])
			@order.postcode = @delivery.postcode
			@order.address = @delivery.address
			@order.name = @delivery.name
		elsif params[:addresses] == "新しいお届け先"
			@order.postcode = params[:postcode]
			@order.address = params[:address]
			@order.name = params[:name]
		end
	end
end
