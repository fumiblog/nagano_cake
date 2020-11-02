class CreateAdminGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_genres do |t|
      t.integer :genre_id
      t.string :name
      t.boolean :is_active

      t.timestamps
    end
  end
end
