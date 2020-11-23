class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @addresses = Address.all

    # @customer = Customer.find(params[:id])
    # binding.pry
  end

  def confirm
    @order = Order.new(order_params)
    #enumを使用したら、文字列を返すので数値にしてやって値を取り出す。
    @order.payment_method = params[:order][:payment_method].to_i
    #flag変数を宣言し、値を代入
    @flag = params[:flag]
    #address変数を宣言し、カレントカスタマーのアドレス内のデータを送られてきたidで見つけ代入。
    @address = current_customer.addresses.find(params[:address_id])
    # binding.pry
  end


  def create
    @order = Order.new(order_params)
    # binding.pry
    @order_detail = OrderDetail.new(order_detail_params)
    
    @order.save
    @order_detail.save
    redirect_to public_orders_complete_path
  #   respond_to do |format|
  # end
  end
  
  def complete
  end



  def index
  end

  def show
    @order = Order.find(params[:id])
    @cart_items = rent_customer.cart_items
  end

  private
  def order_params
    params.require(:order).permit(
      :customer_id,
      :postal_code,
      :address, :name,
      :shipping_cost,
      :total_payment,
      # :payment_method,
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
