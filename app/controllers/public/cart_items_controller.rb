class Public::CartItemsController < ApplicationController
  def index
    @cart_items=Cart_items.all
    @item=Item.
  end
end
