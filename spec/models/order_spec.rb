require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'associations' do
    it { is_expected.to have_and_belong_to_many(:products) }
  end

  describe 'validations' do
    it { is_expected.to monetize(:amount).with_currency(:usd) }
  end
end
