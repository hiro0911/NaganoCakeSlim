class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.references :customer
      t.string :name, null: false
      t.string :postcode, null: false
      t.string :adddress, null: false

      t.timestamps
    end
  end
end
