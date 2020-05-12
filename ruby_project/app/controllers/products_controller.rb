class ProductsController < ApplicationController
    before_action :authenticate_user!, only: [:edit, :update, :destory]

    def index
          @products = Product.all
        @search = params["search"]
        if (@search.present? || @brand.present? || params[:category].present? || params[:seller].present? )
          @title = @search["title"]
          #@description=@search["description"]
          @products = Product.where("title LIKE ? OR description LIKE ? ", "%#{@title}%","%#{@title}%") 
          if @products.empty?
            @products = Product.all
          end
          
          @products= @products.filter_by_brand(params[:category]) if params[:category].present?
          @products = @products.filter_by_brand(params["brand"]) if params[:brand].present?
          @products = @products.filter_by_brand(params[:seller]) if params[:seller].present?
         
        end
    end
     
     
    def new
        @product = Product.new
    end

    def show
        @product = Product.find(params[:id])
    end

    def edit
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

    def update
        @product = Product.find(params[:id])
        if @product.update(product_params)
            authorize! :update , @product
            redirect_to @product
        else
          render 'edit'
        end
    end

    def destroy
        @product = Product.find(params[:id])
         if @product.destroy
            authorize! :destroy , @product
            redirect_to @product
        else      
            render :destroy   
        end 
    end

    def product_params
        params.require(:product).permit(:title, :description, :price, :image, 
                            :inStock_amount, :category_id, :brand_id)
    end    

    def load_data
        @sellers = User.where(role: 'seller')
    end    
end    
