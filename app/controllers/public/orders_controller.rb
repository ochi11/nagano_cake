class Public::OrdersController < ApplicationController

  def index
    @customer = customer.find(params[:id])
	  @orders = @customer.orders
  end

  def show

  end

#顧客の注文情報入力画面
  def new
    @customer = current_customer
		if @customer.cart_items.blank?
			redirect_to public_cart_items_path
		else
			@order = Order.new(customer_id: @customer.id)
			@address = Address.new(customer_id: @customer.id)
		end
  end

  def create

  end

  def confirm

  end

  def complete

  end

  def order_params
    params.require(:order).permit(:customer_id, :payment_method, :order_address, :order_postal_code, :order_name, :postage, :billing_amount, :status)
  end

end
