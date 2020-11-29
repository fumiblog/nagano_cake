class Admins::OrderDetailsController < ApplicationController

  def update
    # binding.pry
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    redirect_to admins_orders_path
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
