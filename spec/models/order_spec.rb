require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'validations' do
    it { is_expected.to monetize(:amount).with_currency(:usd) }
  end
end
