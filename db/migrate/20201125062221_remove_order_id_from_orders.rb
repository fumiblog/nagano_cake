class RemoveOrderIdFromOrders < ActiveRecord::Migration[5.2]
  def up
    remove_column :orders, :order_id
  end
end
