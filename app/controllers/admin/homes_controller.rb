class Admin::HomesController < ApplicationController
  def top
    @order_detaills=OrderDetail.all
    @orders=Order.all
  end
end
