class Admin::OrderDetailsController < ApplicationController
  def index
    @order_detaills=OrderDetail.all
    @orders=Order.all
  end

  def edit
    @order_detaill=OrderDetail.find(params[:id])
  end

  def update
    @order_detail=OrderDetail.find(params[:id])
    @order_detail.update(order_details_params)
    redirect_to admin_order_path(@order_detail.order_id)
  end

  private

  def order_details_params
    params.require(:order_detail).permit(:is_activ)
  end

end
