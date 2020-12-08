class RemoveOrderDetailIdFromOrderDetails < ActiveRecord::Migration[5.2]
  def up
    remove_column :order_details, :order_detail_id
  end
end
