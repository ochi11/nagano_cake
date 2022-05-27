class OrderDetailsController < ApplicationController



      private
    def order_detail_params
      params.require(:order_detail).permit(:purchase_price, :amount, :production_status, :item_id, :order_id)
    end
end
