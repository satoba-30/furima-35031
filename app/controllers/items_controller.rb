class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new(item_params)
  end

  def edit
  end

  def show
  end

  private
  def item_params 
    params.require(:item).permit(:name,:price,:text,:category_id,:status_id,:delivery_fee_id,:post_address_id,:post_daytime_id).merge(user_id: current_user.id)
  end
end
