class RenameCustomerIdColumnToOrdersItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders_items, :customer_id, :item_id
  end
end
