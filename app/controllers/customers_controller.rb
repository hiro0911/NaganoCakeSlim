class CustomersController < ApplicationController
	def show
		@customer = current_customer
	end
	def edit
		@customer = current_customer
	end
	def withdrow
	end
	def switch
		@customer = Customer.find(params[:id])
		@customer.update(customer_params)
		reset_session
		redirect_to root_path, notice: "ご利用ありがとうございました。"
	end
	def customer_params
		params.require(:customer).permit(:email,
																     :password,
													           :family_name_kanji, 
													           :family_name_kana,
													           :first_name_kanji,
													           :first_name_kana,
													           :postcode,
													           :address,
													           :tel,
													           :admission_status)
	end
end
