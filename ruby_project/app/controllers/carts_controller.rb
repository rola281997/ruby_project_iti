class CartsController < ApplicationController
    before_action :authenticated?, :current_cart, :current_order

    def index
        @carts=Checkout.where("cart_id = ?", session[:cart_id])
        
    end

    def check_instock
      @product = Product.find(params[:id])
      @instock = @product.inStock_amount
      
      # render 'add_to_cart'
    end

    def add_to_cart
        @product = Product.find(params[:id])
        session[:product_id] = @product.id
        @cart = Checkout.where("cart_id = ? AND product_id = ?", session[:cart_id], @product.id).first
        if @cart
          if @product.inStock_amount >= 1
           @cart.quantity = @cart.quantity + 1
           @cart.save
           @product.inStock_amount -=1
           @product.save
          end
        else
        @cart = Checkout.new
        @cart.cart_id = session[:cart_id]
        @cart.order_id = session[:order_id]
        @cart.product_id = @product.id
        if @product.inStock_amount >= 1
          @cart.quantity =  1
          @product.inStock_amount -=1
          @product.save
        end
        @cart.user_id = @product.user_id
        @cart.save
        end
        redirect_to request.referrer
        # redirect_to @product
      end

  def current_cart
    if session[:cart_id]
      @cart = Cart.find(session[:cart_id])
    else
      @cart = Cart.new
      @cart.user_id = current_user.id
      @cart.save
      session[:cart_id] = @cart.id
    end
  end

  def current_order
    if session[:order_id]
      @order = Order.find(session[:order_id])
    else
      @order = Order.new
      @order.user_id = current_user.id
      @order.state = 'created'
      @order.save
      session[:order_id] = @order.id
    end
  end


  def authenticated?
    # session[:cart_id]=nil
    # session[:order_id]=nil
    if current_user
        session[:user_id] = current_user.id
    else 
      redirect_to '/users/sign_in'
    end
  end

  
end
