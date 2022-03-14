module Carts
  class ProductsPriceCalculator
    attr_reader :product, :product_quantity

    def initialize(product, product_quantity)
      @product = product
      @product_quantity = product_quantity
    end

    def perform
      case discount_type
      when 'buy_few_get_one'
        DiscountCalculator::BuyFewGetOne.new(*discount_calculator_params).perform
      when 'price_discount'
        DiscountCalculator::PriceDiscount.new(*discount_calculator_params).perform
      when 'price_ratio'
        DiscountCalculator::PriceRatio.new(*discount_calculator_params).perform
      else
        product.price * product_quantity
      end
    end

    private

    def discount_type
      product.discount_rule&.discount_type
    end

    def discount_calculator_params
      [product.price, product_quantity.to_i, discount_params]
    end

    def discount_params
      product.discount_rule.discount_buildup&.symbolize_keys
    end
  end
end
