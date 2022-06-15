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
    @order = Order.new(order_params)
    if params[:_add] == "customersAdd"
        @order.order_postal_code = current_customer.postal_code
        @order.order_address = current_customer.address
        @order.order_name = current_customer.last_name + current_customer.first_name
    elsif params[:_add] == "Adds"
      @address = Address.find(params[:order][:address_id])
      @order.order_postal_code = @address.postal_code
      @order.order_address = @address.address
      @order.order_name = @address.name
    end
    @customer = Customer.find(current_customer.id)
		@cart_items = current_customer.cart_items
  end

  def complete

  end

  def order_params
    params.require(:order).permit(:customer_id, :payment_method, :order_address, :order_postal_code, :order_name, :postage, :billing_amount, :status)
  end

end
