class Public::ItemsController < ApplicationController
  #商品一覧ページ
	def index
        if params["genre"]
        	@items = Item.active.where(genre_id: params["genre"])
        else
			    @items = Item.active
        end
          @genres = Genre.active

	end

# 顧客側の商品詳細ページ
	def show
		@item = Item.find(params[:id])
		@cart_item = CartItem.new(item_id: @item.id)

	#管理者は買い物はできないが、詳細ページの閲覧はできる。
		if current_user.nil?
			items = CartItem.all
		else
			items = current_user.cart_items
		end

	#既にカートに商品が入っているときは、商品一覧ページに戻る
		if items.pluck(:item_id).include?(@cart_item.item_id)
			flash[:warning] = "その商品はカートに入っています"
			redirect_to root_path
		end
	end

	private

#ストロングパラメーター
	def item_params
		params.require(:item).permit(:image_id, :name, :introduction, :price, :genre_id)
	end
end
