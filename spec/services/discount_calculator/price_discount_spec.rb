require 'rails_helper'

RSpec.describe DiscountCalculator::PriceDiscount do
  let(:price) { 3.33 }
  let(:discount_params) { build(:discount_rule, :price_discount).discount_buildup.symbolize_keys }
  let(:discount_calculator_service) { DiscountCalculator::PriceDiscount.new(price, quantity, discount_params) }

  describe '#perform method' do
    context 'when quantity is 0' do
      let(:quantity) { 0 }

      it 'should return price equal to 0' do
        expect(discount_calculator_service.perform.to_f).to eq(0)
      end
    end

    context 'when quantity is less than discount starting quantity' do
      let(:quantity) { 1 }

      it 'should return price equal to 1 item price' do
        expect(discount_calculator_service.perform.to_f).to eq(price)
      end
    end

    context 'when quantity is more than discount starting quantity' do
      let(:quantity) { rand(4..8) }

      it 'should return price with discount' do
        expect(discount_calculator_service.perform.to_f).to eq(quantity * discount_params[:discount_price])
      end
    end
  end
end
