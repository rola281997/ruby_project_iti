Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root 'products#index'
 
  resources :products
  resources :checkouts
  get '/orders/checkout', to: 'orders#update_order', as: 'update_order'
  resources :orders
  get '/carts/addtocart', to: 'carts#add_to_cart', as: 'add_to_cart'
  resources :carts
  

end
