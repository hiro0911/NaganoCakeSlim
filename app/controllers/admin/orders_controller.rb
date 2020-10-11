class Admin::OrdersController < ApplicationController
	def top
	end
	def index
	  @orders = Order.all
	end
	def show
		@order = Order.find(params[:id])
		@order_products = OrderProduct.where(order_id: @order.id)
	end
end
