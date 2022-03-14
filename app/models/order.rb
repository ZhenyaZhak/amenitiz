class Order < ApplicationRecord
  has_and_belongs_to_many :products

  monetize :amount_cents

  validates :amount, presence: true
end
