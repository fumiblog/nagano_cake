class Public::CustomersController < ApplicationController
  
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
    @customer = Customer.find(params[:id])
    # binding.pry
    @customer.update!(customer_params)
    # binding.pry
    redirect_to public_customer_path(@customer.id)
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :postal_code, :postal_code, :address, :telephone_number, :is_deleted)
  end
end

  

