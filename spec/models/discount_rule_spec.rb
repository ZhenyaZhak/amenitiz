require 'rails_helper'

RSpec.describe DiscountRule, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:product)}
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:discount_type) }
    it { is_expected.to define_enum_for(:discount_type).with([:buy_few_get_one, :price_discount, :price_ratio]) }
  end
end
