class ApplicationController < ActionController::Base
  
    before_action :configure_permitted_parameters, if: :devise_controller?
  #   before_action :initialize
  
  # def initialize
  #   session[:order_id] = 0
  #   session[:cart_id] = 0
  # end
      
    
    
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username , :avatar, :role])
  end

end
