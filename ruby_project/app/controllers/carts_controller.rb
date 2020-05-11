class CartsController < ApplicationController
    before_action :authenticated?, :current_cart, :current_order

    def index
        @carts = Cart.all
        @current_cart = session[:cart_id]
        
    end

    def add_to_cart
        @product = Product.find(params[:id])
        @cart = Checkout.new
        @cart.cart_id = session[:cart_id]
        @cart.order_id = session[:order_id]
        @cart.product_id = @product.id
        @cart.save
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
      session[:cart_id] = @order.id
    end
  end


  def authenticated?
    if current_user
        session[:user_id] = current_user.id
    else 
      redirect_to '/users/sign_in'
    end
  end

  
end
