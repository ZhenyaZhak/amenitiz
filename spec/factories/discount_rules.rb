FactoryBot.define do
  factory :discount_rule do
    trait :buy_few_get_one do
      discount_type { :buy_few_get_one }
      discount_buildup { { paid_quantity: 1 } }
    end

    trait :price_discount do
      discount_type { :price_discount }
      discount_buildup { { from_quantity: 3, discount_price: 4.5 } }
    end

    trait :price_ratio do
      discount_type { :price_ratio }
      discount_buildup { { from_quantity: 3, multiplier: 2, divider: 3 } }
    end
  end
end
