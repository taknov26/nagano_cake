class CreateOrdersItems < ActiveRecord::Migration[5.2]
  def change
    create_table :orders_items do |t|
      t.integer :customer_id
      t.integer :order_id
      t.integer :price
      t.integer :amount
      t.integer :make_status, default: "0"
      t.timestamps
    end
  end
end
