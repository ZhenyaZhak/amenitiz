FactoryBot.define do
  factory :product do
    name { 'Green Tea' }
    code { 'GR1' }
    price { 3.11 }

    trait :with_discount do
      discount_rule { build(:discount_rule, :buy_few_get_one) }
    end
  end
end
