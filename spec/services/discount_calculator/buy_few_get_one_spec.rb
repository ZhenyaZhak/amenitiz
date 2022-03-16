require 'rails_helper'

RSpec.describe DiscountCalculator::BuyFewGetOne do
  let(:price) { 3.33 }
  let(:discount_params) { build(:discount_rule, :buy_few_get_one).discount_buildup.symbolize_keys }
  let(:discount_calculator_service) { DiscountCalculator::BuyFewGetOne.new(price, quantity, discount_params) }

  describe '#perform method' do
    context 'when quantity is 0' do
      let(:quantity) { 0 }

      it 'should return price equal to 0' do
        expect(discount_calculator_service.perform.to_f).to eq(0)
      end
    end

    context 'when quantity is 1' do
      let(:quantity) { 1 }

      it 'should return price equal to 1 item price' do
        expect(discount_calculator_service.perform.to_f).to eq(price)
      end
    end

    context 'when quantity is 2' do
      let(:quantity) { 2 }

      it 'should return price equal to 1 item price' do
        expect(discount_calculator_service.perform.to_f).to eq(price)
      end
    end

    context 'when quantity is 3' do
      let(:quantity) { 3 }

      it 'should return price equal to 2 items price' do
        expect(discount_calculator_service.perform.to_f).to eq(price * 2)
      end
    end
  end
end
