class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :genre
      t.string :name, null: false
      t.text :description
      t.integer :price, null: false
      t.boolean :sales_status, null: false
      t.string :image_id

      t.timestamps
    end
  end
end
