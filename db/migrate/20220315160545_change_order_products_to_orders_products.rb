class ChangeOrderProductsToOrdersProducts < ActiveRecord::Migration[6.0]
  def change
    rename_table :order_products, :orders_products
  end
end
