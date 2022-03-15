require 'rails_helper'

RSpec.describe Carts::CalculateProductsPriceController, type: :controller do
  let(:product) { create(:product, :with_discount) }
  let(:test_quantity) { rand(1..10) }

  context 'when passing wrong params' do
    let(:wrong_code) { 'code' }

    it 'cannot GET #index' do
      get :index, params: { cart_params: { product_code: wrong_code, quantity: test_quantity } }
      expect(response).to have_http_status(404)
    end
  end

  context 'when passing correct params' do
    it 'cannot GET #index' do
      get :index, params: { cart_params: { product_code: product.code, quantity: test_quantity } }
      expect(response).to have_http_status(:success)
    end
  end
end
