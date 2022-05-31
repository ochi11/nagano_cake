class HomesController < ApplicationController
  def top
    @items = Item.order(created_at: :desc).limit(10)
  end

  def about

  end

            private
  def item_params
    params.require(:item).permit(:price, :name, :image)
  end

end
