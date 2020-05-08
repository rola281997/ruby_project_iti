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
    
        if @product.save
        redirect_to @product
        else
        render 'new'
        end
    end

    def product_params
        params.require(:product).permit(:title, :description, :price, :image, :inStock_amount, :category_id, :brand_id)

    end    
end    