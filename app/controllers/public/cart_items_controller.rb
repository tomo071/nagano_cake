class Public::CartItemsController < ApplicationController
  def index
    @cart_items=Cart_items.all
    @item=Item.all
  end
  
  def create
    @cart_item=Cart_item.new(cart_items_params)
    @cart_item.save
    
  end
  
  private
  
  def cart_items_params
    params.reqire(:cart_item).permit(:item_id, :amount)
  end
end
