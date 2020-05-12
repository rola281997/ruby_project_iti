class OrdersController < ApplicationController
    def index
        @orders = Order.where("user_id = ?", session[:user_id])   
    end 

    def update_order
        session[:cart_id] = nil
        @order = Order.find(params[:id])
        @order.state = 'pending'
        @order.save
        session[:order_id] = nil
        redirect_to request.referrer
    end
end
