class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.monetize :amount

      t.timestamps
    end
  end
end
