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
    if @order.status == "nyukinmachi" && params[:order][:status] == "nyukinkakunin"
      @order_detail = OrderDetail.where(order_id: params[:id])
      @order_detail.each do |od|
        od.update_attribute(:making_status, "seisakumachi")
      end
      @order.update_attribute(:status, "nyukinkakunin")
    elsif params[:order][:status] == "hassouzumi"
      @order.update_attribute(:status, "hassouzumi")
    else
    end
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