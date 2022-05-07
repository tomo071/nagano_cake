class Public::ItemsController < ApplicationController
  def index
    @items=Item.all
    @genres=Genre.all
    unless params[:genre_id]==nil
      @genre=Genre.find(params[:genre_id])
      @items=@genre.items
    end
  end

  def show
    @item=Item.find(params[:id])
    @genre=Genre.all
    @cart_item=CartItem.new

  end


end
