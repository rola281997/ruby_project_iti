class CartsController < ApplicationController
    before_action :authenticated?, :current_cart

    def index
        @carts = Cart.all
        @current_cart = session[:cart_id]
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


  def authenticated?
    if current_user
        session[:user_id] = current_user.id
    else 
      redirect_to '/users/sign_in'
    end
  end


end
