class CreatePublicHomes < ActiveRecord::Migration[5.2]
  def change
    create_table :public_homes do |t|

      t.timestamps
    end
  end
end
