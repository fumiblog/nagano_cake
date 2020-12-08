class RemoveAddressFromCustomers < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :address, :string
  end
end
