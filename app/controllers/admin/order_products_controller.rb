class Admin::OrderProductsController < ApplicationController
	def update
		@order_product = OrderProduct.find(params[:id])
		@order = @order_product.order
		@order_product.update(order_product_params)
		if @order_product.production_status == "製作中"
			@order_product.order.update(order_status: "製作中")
		end
		if OrderProduct.where(production_status: "製作完了").count == @order.order_products.count
			@order.update(order_status: "発送準備中")
		end
		redirect_to admin_order_path(@order_product.order_id)
	end
	private
	def order_product_params
		params.require(:order_product).permit(:production_status)
	end
end
