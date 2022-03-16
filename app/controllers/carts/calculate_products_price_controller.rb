class Carts::CalculateProductsPriceController < ApplicationController
  def index
    if [product, product_quantity].all?(&:present?)
      render json: { total_price: products_price.to_f }
    else
      render json: { error: I18n.t('controllers.calculate_products_price.not_found') }, status: :not_found
    end
  end

  private

  def products_price
    Carts::ProductsPriceCalculator.new(product, product_quantity).perform
  end

  def product
    @product ||= Product.find_by(code: product_code_params)
  end

  def product_quantity
    @product_quantity ||= params.dig(:cart_params, :quantity).to_i
  end

  def product_code_params
    params.dig(:cart_params, :product_code)
  end
end
