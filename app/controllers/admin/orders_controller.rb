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
	def update
		@order = Order.find(params[:id])
		@order_products = OrderProduct.where(order_id: @order.id)
		@order.update(order_params)
		if @order.order_status == "入金確認"
			@order_products.update(production_status: "製作待ち")
		end
		redirect_to admin_order_path(@order)
	end
	private
	def order_params
		params.require(:order).permit(:order_status)
	end
end
