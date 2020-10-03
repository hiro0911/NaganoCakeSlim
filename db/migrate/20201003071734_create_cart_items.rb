class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.references :customer
      t.references :product
      t.integer :count, null: false
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
