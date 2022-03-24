class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @purchase_destination = PurchaseDestination.new
    if user_signed_in? && @item.user.id == current_user.id
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_destination = PurchaseDestination.new(purchase_destination_params)
    if @purchase_destination.valid?
      @purchase_destination.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_destination_params
    params.require(:purchase_destination).permit(:post_code, :prefecture_id, :city, :address, :apartment, :tel).merge(user_id: current_user.id, item_id: @item.id)
  end
  
end
