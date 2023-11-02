class OrdersController < ApplicationController
  before_action :move_to_index, only: :index

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    end
  end

  private
  
  def order_params
    @item = Item.find(params[:item_id])
    params.require(:order_address).permit(:post_code, :prefectures_id, :city, :city_address, :building_name, :telephone, :order_id).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if user_signed_in? && (@item.user == current_user || @item.order)
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end

end
