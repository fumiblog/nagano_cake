class Admins::OrderDetailsController < ApplicationController

  def update
    # byebug
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update_attribute(:making_status, params[:order_detail][:making_status])
    # byebug
    @order_details = OrderDetail.where(order_id: @order_detail.order_id)
    # byebug
    if @order_details.where(making_status: 'seisakuchu').count == 1
      @order = Order.find(@order_detail.order_id)
      @order.update_attribute(:status, "seisakuchu")
    elsif @order_details.where(making_status: "seisakukanryo").count == @order_details.count
          @order = Order.find(@order_detail.order_id)
      @order.update_attribute(:status, "hassoujunnbichu")
    else
    end
    redirect_to admins_order_path(@order_detail.order)
  end

  private
    def order_detail_params
    params.require(:order_detail).permit(
      :order_id,
      :item_id,
      :price,
      :amount,
      :making_status)
    end
end
