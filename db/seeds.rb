product_1 = Product.create(name: 'Green Tea', code: 'GR1', price: 3.11)
DiscountRule.create(
  product: product_1,
  discount_type: :buy_few_get_one,
  discount_buildup: { paid_quantity: 1 }
)

product_2 = Product.create(name: 'Strawberries', code: 'SR1', price: 5.00)
DiscountRule.create(
  product: product_2,
  discount_type: :price_discount,
  discount_buildup: { from_quantity: 3, discount_price: 4.5 }
)

product_3 = Product.create(name: 'Coffee', code: 'CF1', price: 11.23)
DiscountRule.create(
  product: product_3,
  discount_type: :price_ratio,
  discount_buildup: { from_quantity: 3, multiplier: 2, divider: 3 }
)
