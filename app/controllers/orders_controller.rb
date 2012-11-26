class OrdersController < ApplicationController
	def new
		@order = Order.new
	end
	
	def create
		@order = Order.new(params[:order])
		if @order.save
			redirect_to customers_path, :notice => 'Order Created Successfully'
		else
			render 'new'
		end
	end
end
