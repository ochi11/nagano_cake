class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def unsubscribe
    @customer = current_customer
  end

  def withdraw
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    if @customer.save
     #flash[:alert] = "本当に退会しますか？"
     redirect_to root_path
    else
     render :show
    end
  end

        private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :encrypted_password, :email, :address, :telephone_number, :is_active)
  end
end
