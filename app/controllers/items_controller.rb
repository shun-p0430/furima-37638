class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new
    if @item.save
      redirect_to :index
    else
      render :new
    end
  end
end
