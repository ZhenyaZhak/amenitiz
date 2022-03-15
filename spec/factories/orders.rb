FactoryBot.define do
  factory :order do
    amount_cents { Faker::Number.number(digits: 4) }
    amount_currency { Faker::Currency.code }
  end
end
