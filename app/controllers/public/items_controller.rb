class Public::ItemsController < ApplicationController

  def index
    @genres = Genre.all
    @items = Item.all
    # binding.pry
    # if genre_id?
    #   @items = genre_id.items
    # else
    #   @items = Item.all
    # end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    # binding.pry
  end
  
  

  private
  def item_params
    params.require(:item).permit(:name, :introduction, :price)
  end
  
  def referenced_by_cart_item

	  if cart_items.empty?
		  return true
	  else
		  errors.add(:base, '品目が存在します。')
		  retuen false
	  end
  end
end