class Order < ApplicationRecord
  monetize :amount_cents

  validates :amount, presence: true
end
