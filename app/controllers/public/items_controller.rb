class Public::ItemsController < ApplicationController
  #商品一覧ページ
    def index
          @items = Item.all
          @genres = Genre.all
    end

# 顧客側の商品詳細ページ
	def show
		@item = Item.find(params[:id])
		@cart_item = CartItem.new(item_id: @item.id)
	end

	private

#ストロングパラメーター
	def item_params
		params.require(:item).permit(:image_id, :name, :introduction, :price, :genre_id, :is_active)
	end
end
