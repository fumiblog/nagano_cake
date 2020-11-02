class CreatePublicAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :public_addresses do |t|
      t.integer :address_id
      t.integer :customer_id
      t.string :name
      t.string :postal_code
      t.string :address

      t.timestamps
    end
  end
end
