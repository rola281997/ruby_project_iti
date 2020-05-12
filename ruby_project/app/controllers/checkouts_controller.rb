class CheckoutsController < ApplicationController
    def index
        @carts=Checkout.where("cart_id = ?", session[:cart_id])  
        @order = session[:order_id]
        @total = 0
        @carts.each do |cart|
            @total = @total + (cart.product.price * cart.quantity)
        end      
    end
    def update
        @checkout = Checkout.find(params[:id])
        @product = Product.where(id: @checkout.product_id).first
        @quantity = params[:quantity].to_i 
        if @quantity > @checkout.quantity 
            @new_quantity = (@quantity) - (@checkout.quantity)
            if @product.inStock_amount > @new_quantity
                @product.inStock_amount = @product.inStock_amount - @new_quantity
                @product.save
                @checkout.quantity = @quantity
                @checkout.save
            end
        else
            if @quantity > 1
                @new_quantity = @checkout.quantity - @quantity
                @product.inStock_amount = @product.inStock_amount + @new_quantity
                @product.save
                @checkout.quantity = @quantity
                @checkout.save
            
            end
        end
            
            
            redirect_to request.referrer
      end
    
    def destroy
        @product = Product.find(params[:id])
        @cart = Checkout.where("cart_id = ? AND product_id = ?", session[:cart_id], @product.id).first
        @cart.destroy
        redirect_to request.referrer
    end

end
