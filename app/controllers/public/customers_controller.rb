class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @customer = Customer.new
    # binding.pry
  end

  def create
    @customer = Customer.new(customer_params)
    # bindig.pry
    @customer.save
    redirect_to public_customer_path(@customer.id)
  end

  def index
    @customers = Customer.all
  end

  def show
    # binding.pry
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    # binding.pry
    @customer = Customer.find(params[:id])
    # binding.pry
    @customer.update!(customer_params)
    # binding.pry
    redirect_to public_customer_path(@customer.id)
  end





  def unsubscribe
    # binding.pry
    @customer = Customer.find(params[:id])
    @customer.is_deleted == true
    # @customer.is_deleted.toggle_status!
    # redirect_to root_path
  end

  # def toggle_status!
  #   if true?
  #     "false"
  #   else
  #     "true"
  #   end
  # end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :is_deleted)
  end
end



