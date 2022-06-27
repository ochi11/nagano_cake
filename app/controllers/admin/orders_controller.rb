class Admin::OrdersController < ApplicationController
  def show
   @order = Order.find(params[:id])
   @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    @order_detail = @order.order_details
    @order.update(order_params)

    if @order.status == "入金確認"
      @order_detail.update_all(production_status: "製作待ち")
    end
    redirect_to admin_order_path
  end

    private

  def order_params
    params.require(:order).permit(:customer_id, :payment_method, :order_address, :order_postal_code, :order_name, :postage, :billing_amount, :status)
  end

end
