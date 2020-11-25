class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @addresses = Address.all

    # @customer = Customer.find(params[:id])
    # binding.pry
  end

  def confirm
    # binding.pry
    # @address = Address.find(order_params)

    @order = Order.new(order_params)
    @order.payment_method = params[:order][:payment_method]
    if params[:flag] == '0'
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:flag] == '1'
      @order.postal_code = @address.postal_code(params[:address_id])
      @order.address = @address.address(params[:address_id])
      @order.name = @address.name(params[:address_id])
    else
    end

    # binding.pry
    #enumを使用したら、文字列を返すので数値にしてやって値を取り出す。

    #flag変数を宣言し、値を代入
    # @order.status = 0
    # @flag = params[:flag]
    #address変数を宣言し、カレントカスタマーのアドレス内のデータを送られてきたidで見つけ代入。
    # @address = current_customer.addresses.find(params[:address_id])
    # binding.pry
  end


  def create
    # binding.pry
    # @order_detail = OrderDetail.new(order_detail_params)
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.status = 0
    # @order.payment_method = 0
    @order.shipping_cost = params[:order][:shipping_cost]
    # binding.pry
    # @order_detail = OrderDetail.new(order_detail_params)
    # binding.pry
    @order.save
    # @order_detail.save
    redirect_to complete_public_orders_path
  #   respond_to do |format|
  # end
  end

  def complete
  end



  def index
    @orders = current_customer.orders
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
