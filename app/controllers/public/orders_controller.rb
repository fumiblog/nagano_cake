class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @addresses = current_customer.addresses

    # @customer = Customer.find(params[:id])
    # binding.pry
  end

  def confirm
    # binding.pry
    # @address = Address.find(order_params)

    @order = Order.new(order_params)
    @order.payment_method = params[:order][:payment_method]
    # byebug
    if params[:flag] == '0'
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:flag] == '1'
      # byebug
      @address = Address.find(params[:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    else
    end
  end


  def create
    # binding.pry
    # @order_detail = OrderDetail.new(order_detail_params)
    @cart_items = current_customer.cart_items

    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.status = 0
    @order.shipping_cost = params[:order][:shipping_cost]
    # binding.pry
    @order.save
    # @order_detail.order_id = Order.id
    current_customer.cart_items.each do |f|
      @order_detail = OrderDetail.new
      @order_detail.order_id = @order.id
      @order_detail.item_id = f.item_id
      @order_detail.price = f.item.price
      @order_detail.amount = f.amount
      @order_detail.making_status = 0
      @order_detail.save
    end

    # binding.pry@cart_items = current_customer.cart_items
    # binding.pry
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all

    redirect_to complete_public_orders_path
  #   respond_to do |format|
  # end
  end

  def complete
  end



  def index
    @orders = current_customer.orders
    # @order_details = @order.order_details
    # @order_detail = OrderDetail.find(params[:id])
    # @order_details = order_id.order_details
    # @order_detail = OrderDetail(order_detail_params)
    # @order_detail = OrderDetail.find(params[:id])
  end

  def show
    @order = Order.find(params[:id])
    # binding.pry
    @order_details = @order.order_details
  end

  private
  def order_params
    params.require(:order).permit(
      :customer_id,
      :postal_code,
      :address,
      :name,
      :shipping_cost,
      :total_payment,
      :payment_method,
      :status)

  end
  def order_detail_params
    params.require(:order_detail).permit(
      :order_id,
      :item_id,
      :price,
      :amount,
      :making_status)
  end
  def address_params
    params.require(:address).permit(
      :customer_id,
      :name,
      :address,
      :postal_code)
  end

end
