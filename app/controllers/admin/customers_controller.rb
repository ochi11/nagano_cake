class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

        private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :encrypted_password, :email, :address, :telephone_number, :is_active)
  end
end
