class ProductsController < ApplicationController
	def top
		@genres = Genre.all
		@products = Product.all
	end
	def index
		@genres = Genre.all
		@products = Product.all
	end
	def show
		@genres = Genre.all
		@product = Product.find(params[:id])
		@cart_item = CartItem.new
	end
end
