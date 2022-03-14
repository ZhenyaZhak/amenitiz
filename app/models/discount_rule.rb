class DiscountRule < ApplicationRecord
  belongs_to :product

  enum discount_type: {
    buy_few_get_one: 0,
    price_discount: 1,
    price_ratio: 2
  }

  validates :discount_type, presence: true
end
