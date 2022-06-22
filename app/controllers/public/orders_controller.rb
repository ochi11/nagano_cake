class Public::OrdersController < ApplicationController

  def index
	  @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @orders = @order.order_details
    #@total =  0
      #@orders.each do |order_detail|
        #@total = @total + (order_detail.price * order_detail.amount)
      #end
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
    @cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    @order.postage = 800
    if @order.save!
      @cart_items.each do |cart_item|
        @order_detail = OrderDetail.new
        @order_detail.item_id = cart_item.item_id
        @order_detail.amount = cart_item.amount
        @order_detail.purchase_price = cart_item.item.add_tax_price
        @order_detail.order_id = @order.id
        @order_detail.save!
      end
        redirect_to complete_public_orders_path
        @cart_items.destroy_all
    else
        @order = Order.new(order_params)
        render :new
    end
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

  def order_detail_params
    params.require(:order_detail).permit(:item_id, :order_id, :purchase_price, :amount, :production_status)
  end

end
