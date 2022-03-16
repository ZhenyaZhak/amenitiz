class OrdersController < ApplicationController
  def create
    order = Order.new(order_params)
    if order.save
      render json: { orders: Order.all }
    else
      render json: { error: I18n.t('controllers.orders.unprocessable_entity') }, status: :unprocessable_entity
    end
  end

  def show
    @order = Order.find(params[:id])
    @order_products = @order.order_content.values
  end

  private

  def order_params
    params.require(:order).permit(:amount, order_content: {})
  end
end
