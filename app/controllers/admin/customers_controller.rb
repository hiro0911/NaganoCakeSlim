class Admin::CustomersController < ApplicationController
	@customers = Customer.all
end
