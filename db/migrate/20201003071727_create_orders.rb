class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :customer
      t.string :name, null: false
      t.string :postcode, null: false
      t.string :address, null: false
      t.integer :postage, null: false
      t.integer :billing_amount, null: false
      t.integer :payment, null: false
      t.integer :order_status, null: false
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
