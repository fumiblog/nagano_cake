class CreatePublicCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :public_cart_items do |t|
      t.integer :cart_item_id
      t.integer :item_id
      t.integer :customer_id
      t.integer :amount

      t.timestamps
    end
  end
end
