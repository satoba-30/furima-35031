class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_params,only: [:show,:edit,:update]

  def index
    @items = Item.all.order(id: 'DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    unless current_user == @item.user
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :price, :text, :image, :category_id, :status_id, :delivery_fee_id, :post_address_id,
                                 :post_daytime_id).merge(user_id: current_user.id)
  end

  def set_params
    @item = Item.find(params[:id])
  end
  
end
