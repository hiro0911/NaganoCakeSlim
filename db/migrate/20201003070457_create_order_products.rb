class CreateOrderProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :order_products do |t|
      t.references :product
      t.references :order
      t.integer :count, null: false
      t.integer :price, null: false
      t.integer :production_status, null: false

      t.timestamps
    end
  end
end
