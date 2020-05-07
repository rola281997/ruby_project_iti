class BrandsController < ApplicationController
    def index
        @brands = Brand.all
      end
     
      def show
        @brand = Brand.find(params[:id])
      end
     
      def new
        @brand = Brand.new
      end
     
      def edit
        @brand = Brand.find(params[:id])
      end
     
      def create
        @brand = Brand.new(brand_params)
     
        if @brand.save
            #flash[:notice] = 'Category added!' 
            redirect_to @brand
        else
            #flash[:error] = 'Failed to edit Category!'
            render 'new'
        end
      end
     
     
      def update
        @brand = Brand.find(params[:id])
     
        if @brand.update(brand_params)
           # flash[:notice] = 'Category updated!'
          redirect_to @brand
        else
           # flash[:error] = 'Failed to edit Category!' 
          render 'edit'
        end
      end
     
      def destroy
        @brand = Brand.find(params[:id])
         if @brand.destroy
           # flash[:notice] = 'Product deleted!' 
            redirect_to brands_path
        
        else   
            #flash[:error] = 'Failed to delete this Category!'   
            render :destroy   
          end 
      end
     
      private
        def brand_params
          params.require(:brand).permit(:name)
        end
end
