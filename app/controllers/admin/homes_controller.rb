class Admin::HomesController < ApplicationController
  def top
    @orders = Order.all
  end

          private
  def order_params
    params.require(:order).permit(:customer_id, :status, :order_name)
  end
end
