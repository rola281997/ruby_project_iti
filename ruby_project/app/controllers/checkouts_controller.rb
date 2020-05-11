class CheckoutsController < ApplicationController
    
    def destroy
        @product = Product.find(params[:id])
        @cart = Checkout.where("cart_id = ? AND product_id = ?", session[:cart_id], @product.id).first
        @cart.destroy
        redirect_to request.referrer
    end

end
