class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :postal_code
      t.string :address
      t.string :orders_name
      t.integer :shipping
      t.integer :billing_amount
      t.integer :payment
      t.integer :orders_status, default: "0"
      t.timestamps
    end
  end
end
