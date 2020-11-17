class Public::CartItemsController < ApplicationController

  before_action :set_line_item, only: [:add_item, :destroy]
  before_action :set_user
  before_action :set_cart

  def index
    # binding.pry
    @cart_items = CartItem.all
    # @item = Item.find(params)
    # binding.pry
  end

  def show
    # binding.pry
    @cart_item = CartItem.find(params[:id])
  end

  def add_item
    # binding.pry
    @line_item = @cart.line_items.build(product_id: params[:product_id]) if @line_item.blank?
    @line_item.quantity += params[:quantity].to_i
    if @line_item.save
      redirect_to current_cart
    else
      redirect_to controller: "products", action: "show"
    end
  end

  def create
      # binding.pry
      @cart = current_cart
      # item = Item.find(params[:item_id])
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.customer_id = current_customer.id
      # binding.pry
      @cart_item.save
      redirect_to public_cart_items_path
  end

    def update
    # binding.pry
      @cart = current_cart
      @item = Item.find(params[:item_id])
      @cart_item = @cart.line_items.build(good: good)
      redirect_to public_cart_items_path
    end

  def destroy
    @cart.destroy
    redirect_to current_cart
  end

  private
  def set_user
    @user = current_customer
  end

  def set_line_item
    # binding.pry
    @line_item = current_cart.line_items.find_by(product_id: params[:product_id])
  end

  def set_cart
    @cart = current_cart
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :amount)
  end
end
