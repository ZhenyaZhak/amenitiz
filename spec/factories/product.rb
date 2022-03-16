FactoryBot.define do
  factory :product do
    name { Faker::Food.fruits }
    code { 'GR1' }
    price_cents { Faker::Number.number(digits: 4) }

    trait :with_discount do
      discount_rule { build(:discount_rule, :buy_few_get_one) }
    end
  end
end
