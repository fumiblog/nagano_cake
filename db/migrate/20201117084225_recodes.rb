class Recodes < ActiveRecord::Migration[5.2]
  def change
    drop_table :public_cart_items
  end
end
