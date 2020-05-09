class CartsController < ApplicationController
    before_action :authenticated?

    def index
    end

  def current_cart
    if session[:cart_id]
      @current_cart = Cart.find(session[:cart_id])
    else
      @current_cart = Cart.new
      session[:cart_id] = @current_cart.id
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
