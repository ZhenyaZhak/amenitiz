FactoryBot.define do
  factory :product do
    name { 'Green Tea' }
    code { 'GR1' }
    price { 3.11 }

    trait :with_discount do
      discount_rule
    end
  end
end
