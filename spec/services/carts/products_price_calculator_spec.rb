require 'rails_helper'

RSpec.describe Carts::ProductsPriceCalculator do
  let(:product_price) { 3.33 }
  let(:product) { create(:product, price: product_price, discount_rule: discount_rule) }
  let(:price_calculator_service) { Carts::ProductsPriceCalculator.new(product, product_quantity) }

  describe '#perform method' do
    context 'when discount_type is buy_few_get_one' do
      let(:discount_rule) { build(:discount_rule, :buy_few_get_one) }

      context 'when product_quantity is 1' do
        let(:product_quantity) { 1 }

        it 'should return correct products price for one item' do
          expect(price_calculator_service.perform.to_f).to eq(product_price)
        end
      end

      context 'when product_quantity is 2' do
        let(:product_quantity) { 2 }

        it 'should return correct products price for two items' do
          expect(price_calculator_service.perform.to_f).to eq(product_price)
        end
      end
    end

    context 'when discount_type is price_discount' do
      let(:discount_rule) { build(:discount_rule, :price_discount) }

      context 'when product_quantity less than discount starting quantity' do
        let(:product_quantity) { 1 }

        it 'should return correct products price for one item' do
          expect(price_calculator_service.perform.to_f).to eq(product_price)
        end
      end

      context 'when product_quantity more than discount starting quantity' do
        let(:product_quantity) { 4 }
        let(:price_with_discount) { product_quantity * discount_rule.discount_buildup['discount_price'] }

        it 'should return correct products price with discount' do
          expect(price_calculator_service.perform.to_f).to eq(price_with_discount)
        end
      end
    end

    context 'when discount_type is price_ratio' do
      let(:discount_rule) { build(:discount_rule, :price_ratio) }

      context 'when product_quantity less than discount starting quantity' do
        let(:product_quantity) { 1 }

        it 'should return correct products price for one item' do
          expect(price_calculator_service.perform.to_f).to eq(product_price)
        end
      end

      context 'when product_quantity more than discount starting quantity' do
        let(:product_quantity) { 4 }
        let(:price_with_discount) do
          product_price * product_quantity * discount_rule.discount_buildup['multiplier'] /
            discount_rule.discount_buildup['divider']
        end

        it 'should return correct products price with discount' do
          expect(price_calculator_service.perform.to_f).to eq(price_with_discount)
        end
      end
    end

    context 'when discount_type is empty' do
      let(:discount_rule) { nil }
      let(:product_quantity) { rand(1..10) }

      it 'should return products price multiplied by quantity' do
        expect(price_calculator_service.perform.to_f).to eq(product_price * product_quantity)
      end
    end
  end
end
