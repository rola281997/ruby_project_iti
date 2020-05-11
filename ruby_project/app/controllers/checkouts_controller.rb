class CheckoutsController < ApplicationController
    def update
        @checkout = Checkout.find(params[:id])
        @product = Product.where(id: @checkout.product_id).first
        @quantity = params[:quantity].to_i 
        if @quantity > @checkout.quantity
            @new_quantity = (@quantity) - (@checkout.quantity)
            if @product.inStock_amount > @new_quantity
                @product.inStock_amount = @product.inStock_amount - @new_quantity
                @product.save
            end
        else
            @new_quantity = @checkout.quantity - @quantity
            @product.inStock_amount = @product.inStock_amount + @new_quantity
            @product.save
        end
            @checkout.quantity = @quantity
            @checkout.save
            
            redirect_to request.referrer
      end
    
    def destroy
        @product = Product.find(params[:id])
        @cart = Checkout.where("cart_id = ? AND product_id = ?", session[:cart_id], @product.id).first
        @cart.destroy
        redirect_to request.referrer
    end

end
