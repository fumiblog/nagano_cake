class Admins::OrdersController < ApplicationController
  def index
    @orders = Order.all
    # @order_details = OrderDitail.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    # binding.pry
  end

  def update
    @order = Order.find(params[:id])
    # binding.pry
    # @order_details = @order.order_details
    @order.update(order_params)
    # @order_detail.update(order_detail_params)
    redirect_to admins_order_path(@order)
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


end
