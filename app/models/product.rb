class Product < ApplicationRecord
  has_one :discount_rule

  monetize :price_cents

  validates :name, :code, :price, presence: true
end
