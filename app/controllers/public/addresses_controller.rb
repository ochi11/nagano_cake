class Public::AddressesController < ApplicationController
      #配送先一覧
    def index
        @customer = current_customer
        @addresses = @customer.addresses
        @address = Address.new
    end

    #配送先新規保存
    def create
        @address = Address.new(address_params)
        @address.customer_id = current_customer.id
       if @address.save
           flash[:success] = "登録に成功しました"
           redirect_to public_addresses_path
        else
            @customer = current_customer
            @addresses = @customer.addresses.all
            flash[:warning] = "入力内容を確認してください"
            render :index
        end
    end

    #配送先削除
    def destroy
        @address = Address.find(params[:id])
        @address.destroy
        flash[:success] = "削除に成功しました"
        redirect_to public_addresses_path
    end

    #配送先編集
    def edit
        @address = Address.find(params[:id])

        if  current_customer.id != @address.customer_id
            flash[:warning] = "アクセス権がありません"
            redirect_to edit_public_addresses_path
        end
    end

    #編集内容保存
    def update
        @address = Address.find(current_customer.id)

        if @address.update(address_params)
            redirect_to public_addresses_path
            flash[:success] =  "更新に成功しました"
        else
            flash[:warning] = "入力内容を確認してください"
            render :edit
        end
    end

private
    def address_params
        params.require(:address).permit(:name, :postal_code, :address, :customer_id)
    end
end
