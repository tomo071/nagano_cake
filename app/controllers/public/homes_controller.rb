class Public::HomesController < ApplicationController
  def top
    @items=Item.all
    @genres=Genre.all
    unless params[:genre_id]==nil
      @genre=Genre.find(params[:genre_id])
      @items=@genre.items
    end
  end


  def about
  end
end
