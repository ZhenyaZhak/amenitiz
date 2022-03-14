class Product < ApplicationRecord
  has_one :discount_rule
  has_and_belongs_to_many :orders

  monetize :price_cents

  validates :name, :code, :price, presence: true
end
