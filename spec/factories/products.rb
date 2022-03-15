FactoryBot.define do
  factory :product do
    name { Faker::Food.fruits }
    code { Faker::Code.nric }
    price_cents { Faker::Number.number(digits: 4) }
  end
end
