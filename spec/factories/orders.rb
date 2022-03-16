FactoryBot.define do
  factory :order do
    amount_cents { Faker::Number.number(digits: 4) }
  end
end
