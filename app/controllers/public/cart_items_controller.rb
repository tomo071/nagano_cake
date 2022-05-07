class Public::CartItemsController < ApplicationController
  def index
    @cart_items=current_customer.cart_items
    @item=Item.all
    @price=0
  end

  def create
    @cart_item=CartItem.new(cart_items_params)
    @cart_item.customer_id=current_customer.id
    @cart_item.save
    redirect_to public_cart_items_path
  end

  def all_destroy
    @cart_items=current_customer.cart_items
    @cart_items.delete_all
    redirect_to public_cart_items_path
  end

  def destroy
    @cart_item=CartItem.find(params[:id])
    @cart_item.delete
  end

  def update
    @cart_item=CartItem.find(params[:id])
    @cart_item.update(cart_items_params)
  end

  private

  def cart_items_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end
