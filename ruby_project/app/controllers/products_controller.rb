class ProductsController < ApplicationController
    def index
        @products = Product.all
    end
     
    def new
        @product = Product.new
    end

    def show
        @product = Product.find(params[:id])
    end

    def create
        @product = Product.new(product_params)
        @product.user_id = current_user.id
        if @product.save
        redirect_to @product
        else
        load_data    
        render 'new'
        end
    end

    def product_params
        params.require(:product).permit(:title, :description, :price, 
                            :inStock_amount, :category_id, :brand_id)
    end    

    def load_data
        @sellers = User.where(role: 'seller')
    end    
end    