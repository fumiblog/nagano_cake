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
    # byebug
    if @order.status == "nyukinkakunin"
      @order_detail = OrderDetail.find(params[:id])
      making_status.seisakumachi!
      @order.update(order_params)
    end
    # byebug
    redirect_to admins_order_path(@order)
    
  end

  # def toggle_status
  #   # byebug
  #   @order = Order.find(params[:id])
  #   if staitus.nyukinkakunin?
      
  #     @order_detail.maiking_status.seisakumachi!
  #     @order.update
  #   end
  #   buyb
  #   redirect_to admins_order_path(@order)
  # end

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
