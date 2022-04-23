class Public::ItemsController < ApplicationController
  def index
    @items=Item.all
  end

  def show
    @item=Item.find(params[:id])
    @newitem=Cart_item.new
  end
  
  
end
