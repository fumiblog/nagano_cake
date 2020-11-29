class HomesController < ApplicationController

  def top
    # @items = Item.all
    @order_details =  OrderDetail.find(
      Like.group(:amount).order('count(amount) desc').limit(3).pluck(:amount))
    @genres = Genre.all
  end
  
  def top2
    
  end

  def about
  end

end
