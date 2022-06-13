class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
    #@total_price = subtotal * cart_item
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @total = 0
    @cart_item.subtotal
    @total += @cart_item.subtotal
    @cart_item.update(cart_item_params)
    redirect_to public_cart_items_path
  end

  def create
    #binding.pry
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    redirect_to public_cart_items_path
  end

  #ある商品の入ったカートを空にする
  def destroy
    @cart_item = CartItem.find(params[:id])
  	@cart_item.destroy
    redirect_to public_cart_items_path
  end

  #カートを空にする
  def destroy_all
  	@cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to public_cart_items_path
  end

  private
    def cart_item_params
      params.require(:cart_item).permit(:customer_id, :item_id, :amount)
    end

end
