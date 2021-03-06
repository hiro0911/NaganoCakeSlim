class Admin::ProductsController < ApplicationController
	def index
		@products = Product.all
	end
	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		@product.genre_id = params[:product][:genre_id]
		if @product.save!
			redirect_to admin_product_path(@product)
		else
			render :new
		end
	end

	def show
		@product = Product.find(params[:id])
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		if @product.update(product_params)
			redirect_to admin_products_path
		else
			render :edit
		end
	end

	private

	def product_params
		params.require(:product).permit(:genre_id, :name, :description, :price, :sales_status, :image)
	end

end
