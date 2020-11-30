class HomesController < ApplicationController

  def top
    # @items = Item.all
    @order_details =  OrderDetail.find(
      OrderDetail.group(:item_id).order('count(item_id) desc').limit(3).pluck(:item_id))
    @genres = Genre.all
  end

  def top2

  end

  def about
  end

end
