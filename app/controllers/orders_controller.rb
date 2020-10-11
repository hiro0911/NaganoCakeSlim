class OrdersController < ApplicationController
	def index
		@orders = Order.where(customer_id: current_customer.id)
	end
	def show
		@order = Order.find(params[:id])
		@order_products = OrderProduct.where(order_id: @order.id)
	end
	def new
		@order = Order.new
		@deliveries = Delivery.where(customer_id: current_customer.id)
	end
	def confirm
		@cart_items = CartItem.where(customer_id: current_customer.id)
		@order = Order.new(customer_id: current_customer.id,
											 payment: params[:order][:payment],
											 postage: 800)
		if params[:order][:addresses] == "ご自身の住所"
			@order.postcode = current_customer.postcode
			@order.address = current_customer.address
			@order.name = current_customer.full_name_kanji
		elsif params[:order][:addresses] == "登録済み住所から選択"
			@delivery = Delivery.find(params[:delivery_id])
			@order.postcode = @delivery.postcode
			@order.address = @delivery.address
			@order.name = @delivery.name
		elsif params[:order][:addresses] == "新しいお届け先"
			@order.postcode = params[:postcode]
			@order.address = params[:address]
			@order.name = params[:name]
		end
	end
	def create
		@cart_items = CartItem.where(customer_id: current_customer)
		@order = Order.new(order_params)
		@order.customer_id = current_customer.id
		if @order.save!
			@cart_items.each do |cart_item|
				OrderProduct.create!(order_id: @order.id,
															 product_id: cart_item.product_id,
															 count: cart_item.count,
															 price: cart_item.subtotal,
															 production_status: "着手不可")
			end
			@cart_items.destroy_all
			redirect_to orders_thanks_path
		else
			render :new
		end
	end
	private
	def order_params
		params.require(:order).permit(:customer_id, :name, :postcode, :address, :postage, :billing_amount, :payment, :order_status)
	end
end
