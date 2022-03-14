module DiscountCalculator
  class PriceRatio
    attr_reader :price, :quantity, :discount_params

    def initialize(price, quantity, discount_params)
      @price = price
      @quantity = quantity
      @discount_params = discount_params
    end

    def perform
      if quantity >= from_quantity
        quantity * price * price_multiplier / price_divider
      else
        quantity * price
      end
    end

    private

    def from_quantity
      discount_params[:from_quantity]
    end

    def price_multiplier
      discount_params[:multiplier]
    end

    def price_divider
      discount_params[:divider]
    end
  end
end
