class Public::CartItemsController < ApplicationController
   def index
    @cart_items = current_customer.cart_items
  end

  def create
    @cart_item = CartItem.new(item_params)
    @cart_item.customer_id = current_customer.id
    #税抜の小計価格を設定
    #@cart_item.price = @cart_item.item.price * @cart_item.amount
    @cart_item.save
    redirect_to cart_items_path
  end

  #ある商品の入ったカートを空にする
  def destroy
    @cart_item = CartItem.find(params[:id])
  	@cart_item.destroy
    redirect_to cart_items_path
  end

  #カートを空にする
  def destroy_all
  	@cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to cart_items_path
  end

  #再計算する
  def update_all
  @items = current_customer.cart_items

  @items.each do |item|
        item.amount = params[:amount][item.id.to_s].to_i
        item.save
        flash[:success] =  "更新に成功しました"
  end
        flash[:warning] = "入力内容を確認してください"
        redirect_to cart_items_path
  end

  private
    def cart_item_params
      params.require(:cart_item).permit(:customer_id, :item_id, :amount)
    end

end
