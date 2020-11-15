class CartItemsController < ApplicationController
  
  before_action :set_line_item, only: [:add_item, :destroy]
  before_action :set_customer
  before_action :set_cart_item

  def show
    # binding.pry
    # @item_id = Cart_item.find(params[:id])
    @line_items = @cart_item.line_items
  end

  def add_item
    @line_item = @cart_item.line_items.build(product_id: params[:product_id]) if @line_item.blank?
    @line_item.quantity += params[:quantity].to_i
    if @line_item.save
      redirect_to current_cart_item
    else
      redirect_to controller: "products", action: "show"
    end
  end

  def destroy
    @cart_item.destroy
    redirect_to current_cart_item
  end

  private
  def set_customer
    @customer = current_customer
  end

  def set_line_item
    @line_item = current_cart_item.line_items.find_by(product_id: params[:product_id])
  end

  def set_cart_item
    @cart_item = current_cart_item
  end
end
