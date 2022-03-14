module DiscountCalculator
  class PriceDiscount
    attr_reader :product_price, :quantity, :discount_params

    def initialize(product_price, quantity, discount_params)
      @product_price = product_price
      @quantity = quantity
      @discount_params = discount_params
    end

    def perform
      quantity * price
    end

    private

    def price
      quantity >= from_quantity ? discount_price : product_price
    end

    def from_quantity
      discount_params[:from_quantity]
    end

    def discount_price
      discount_params[:discount_price]
    end
  end
end
