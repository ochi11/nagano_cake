class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(current_customer.id)
  # 他のcustomerのアクセス阻止
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
    @customer = Customer.find(current_customer.id)
    if @customer.update(customer_params)
       flash[:success] =  "更新に成功しました"
       redirect_to public_customers_path(current_customer)
    else
       flash[:warning] = "入力内容を確認してください"
       render :edit
    end
  end

  def unsubscribe

  end

  def withdraw
    @customer = Customer.find(current_customer.id)
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path

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
