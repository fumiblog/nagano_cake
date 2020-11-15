class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
    @genres = Genre.all
  end
  
  def edit
    @item = Item.find(params[:id])
  end
  
  
  private
  def item_params
    params.require(:item).permit(:name, )
  end
end