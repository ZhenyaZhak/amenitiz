class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show ]

  def create
    @order = Order.create(amount_cents: (params[:total_price].to_f * 100).to_i, amount_currency: 'USD')
    params[:order_params].values.each do |param|
      product = Product.find_by(code: param[:product_code])
      OrderProduct.create(product: product, order: @order, quantity: param[:quantity])
    end
    respond_to do |format|
      if @order.save
        format.json { render :json => { orders: Order.all } }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def show
    @order_products = OrderProduct.where(order_id: @order.id).includes(:product).map do |op|
      {
        id: op.id,
        name: op.product.name,
        quantity: op.quantity,
      }
    end
  end

  private
  def set_order
    @order = Order.find(params[:id])
  end
end
