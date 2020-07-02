class Customers::ItemsController < ApplicationController
	    before_action :valid_genre

    def index
        @items = Item.where(is_active: true,genre_id: @genres)
	end
	def new
		@item = Item.new
	end

	def show
        @item = Item.find(params[:id])
      unless @item.is_active == '販売中' && @item.genre.is_active == '有効'
        redirect_to customers_items_path
      end
        @cart_item = CartItem.new
	end

    def search
        @genre = Genre.find(params[:genre_id])
        if @genre.is_active == '有効'
            @items = Item.where(genre_id: params[:genre_id])
        else
            redirect_to customers_items_path
        end
    end

    def price
    end

    private

    def valid_genre
        @genres = Genre.where(is_active: true)
    end
end
