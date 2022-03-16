class AddOrderInfoToOrders < ActiveRecord::Migration[6.0]
  def change
    drop_table :orders_products

    change_table :orders do |t|
      t.json :order_content, default: '{}'
    end
  end
end
