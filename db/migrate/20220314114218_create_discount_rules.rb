class CreateDiscountRules < ActiveRecord::Migration[6.0]
  def change
    create_table :discount_rules do |t|
      t.references :product, null: false, foreign_key: true
      t.integer :discount_type
      t.json :discount_buildup, default: '{}'

      t.timestamps
    end
  end
end
