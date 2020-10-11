class AddColumnToOrder < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :order_products, foreign_key: true
  end
end
