class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
    @genre = Genre.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:success] = "登録に成功しました"
      redirect_to admin_items_path
    else
      flash[:warning] = "入力内容を確認してください"
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:success] = "更新に成功しました"
      redirect_to admin_item_path
    else
      flash[:warning] = "入力内容を確認してください"
      render :show
    end
  end

  private
    def item_params
      params.require(:item).permit(:name, :image, :price, :introduction, :genre_id, :is_active)
    end
end
