class ItemsController < ApplicationController

  def index
    @items = Item.all
    @genres = Genre.all
    # binding.pry
  end
  
  private
  
  def item_params
    params.require(:item).parmit(name, price, image_id)
  end
end
