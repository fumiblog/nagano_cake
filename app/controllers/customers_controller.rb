class CustomersController < ApplicationController
  
  def new
    @customer = Customer.new
  end
  
  def create
    @customer = Customer.new(customer_params)
    @customer.save
    redirect_to new_customers_path
  end
  
  private
  def customer_params
    params.require(:customer).parmit(:image_id, :name, :introduction, :genre_id, :price, :is_active)
  end
end
