class CustomersController < ApplicationController
	def index
		@customers = Customer.all
	end
	
	def new
		@customer = Customer.new
		@customer.orders.build
	end
	
	def create
		@customer = Customer.new(params[:customer])
		if @customer.save
			redirect_to customers_path, :notice => 'Created Successfully'
		else
			render 'new'
		end
	end
end
