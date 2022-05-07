class Public::OrdersController < ApplicationController
  def new
    @order=Order.new
  end

   def comfirm
    @cart_items=current_customer.cart_items
    @order = Order.new
    @order.is_activ=0
    @order.postage=800
    @order.pay_method=params[:order][:pay_method]
    if params[:order][:address_option]== "0"
      @order.postal_code = current_customer.postal_code
      @order.postal_address = current_customer.address
      @order.postal_name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:address_option]=="1"
      @address=Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.postal_address = @address.address
      @order.postal_name = @address.name
    else
      @order.postal_code = params[:order][:postal_code]
      @order.postal_address = params[:order][:postal_address]
      @order.postal_name = params[:order][:postal_name]
    end
    sum=0
    @cart_items.each do |cart_item|
      sum+=(cart_item.item.with_tax_price * cart_item.amount)
    end
    sum += @order.postage
    @order.price=sum
   end

  def create
    @order=Order.new(order_params)
    @order.is_activ=0
    @a=current_customer.cart_items
    @order.save
    @a.each do |a|
      @order_detaills=OrderDetail.new
      @order_detaills.item_id= a.item_id
      @order_detaills.order_id= @order.id
      @order_detaills.price= a.item.with_tax_price
      @order_detaills.quantity= a.amount
      @order_detaills.is_activ= 0
      @order_detaills.save
    end
    @a.delete_all
    redirect_to public_orders_complete_path
  end

  def complete
  end

  def index
    @orders=current_customer.orders
  end

  def show
    @order=Order.find(params[:id])
    @price=0
    @order_details=@order.order_details
  end

  def update
    @order=Order.find(params[:id])
    @order.update(order_params)
  end

  private

  def order_params
  params.require(:order).permit(:pay_method, :postal_code, :postal_address, :postal_name, :customer_id, :postage,:price )
  end
end
