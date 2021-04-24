class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_params
  before_action :move_to_top
  before_action :purchased_to_index

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:post_num, :post_address_id, :city, :address, :build, :telephone_num, :token).merge(
      token: params[:token], user_id: current_user.id, item_id: params[:item_id]
    )
  end

  def set_params
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_top
    redirect_to root_path if current_user == @item.user
  end

  def purchased_to_index
    redirect_to root_path if @item.order.present?
  end
end
