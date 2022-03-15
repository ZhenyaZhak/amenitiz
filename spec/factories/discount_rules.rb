FactoryBot.define do
  factory :discount_rule do
    product { Faker::Food.fruits }
    discount_type { Faker::Number.within(range: 1..3) }
  end
end
