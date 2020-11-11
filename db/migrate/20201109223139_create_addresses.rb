class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|

      t.timestamps
      t.integer :customer_id
      t.string :name
      t.string :postal_code
      t.string :address
      t.string :telephone_number
    end
  end
end
