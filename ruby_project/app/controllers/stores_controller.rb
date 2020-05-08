class StoresController < ApplicationController
    def new
        load_data
        @store = Store.new
    end
    def create
        @store = Store.new(store_params)
        if @store.save
            redirect_to @store
          else
            load_data
            render 'new'
          end
    end

    private
    def store_params
        params.require(:store).permit(:name, :summary, :user_id)
    end
    def load_data
        @sellers = User.where(role: 'seller')
    end
end
