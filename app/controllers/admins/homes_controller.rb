class Admins::HomesController < ApplicationController

  def top
    # @orders = Order.where(
    #   "created_at between '#{Date.today} 0:00:00' and '#{Date.today} 23:59:59'")
    # @itmes = Item.all
    @orders = Order.where("created_at >= ?", Date.today)
    # byebug
  end
end
