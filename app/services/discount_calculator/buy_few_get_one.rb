module DiscountCalculator
  class BuyFewGetOne
    NUMBER_OF_FREE = 1

    attr_reader :price, :quantity, :discount_params

    def initialize(price, quantity, discount_params)
      @price = price
      @quantity = quantity
      @discount_params = discount_params
    end

    def perform
      quantity / paid_quantity * price * (paid_quantity - NUMBER_OF_FREE) + quantity % paid_quantity * price
    end

    private

    def paid_quantity
      @paid_quantity ||= discount_params[:paid_quantity] + NUMBER_OF_FREE
    end
  end
end
