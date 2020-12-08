class Admins::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    @customer.save
    redirect_to new_customers_path
  end

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admins_customers_path
  end

  private
  def customer_params
    params.require(:customer).permit(
      :last_name,
      :first_name,
      :last_name_kana,
      :first_name_kana,
      :email,
      :encrypted_password,
      :postal_code,
      :address,
      :telephone_number,
      :is_deleted)
  end
end
