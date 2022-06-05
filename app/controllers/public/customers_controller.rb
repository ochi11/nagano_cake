class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find_by(params[:id])
  # 他のcustomerのアクセス阻止
    unless current_customer.nil? || current_customer.id == @customer.id
      flash[:warning] = "アクセス権がありません"
      redirect_to public_customer_path(current_customer)
    end
  end

  def create
    @customer = Customer.new(customer_params)
    @customer_id = current_customer.id
    if @customer.save
      redirect_to customer_path
    else
      render :new
    end
  end

  private



  def customer_params
  		params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :address, :postal_code, :telephone_number, :email, :is_active)
  end
end
