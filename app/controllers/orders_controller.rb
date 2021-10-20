class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit update destroy]

  def index
    @orders = current_user.orders
  end

  def show
    @order_items = @order.order_items
  end

  def create
    user = User.find(params[:user_id])
    cart = user.cart
    cart_items = cart.cart_items
    order = Order.create(user_id: user.id)
    cart_items.each do |cart_item|
      order.order_items.create(product_id: cart_item.product_id, total: cart_item.total)
      cart_item.destroy
    end
    cart.update(total_price: 0)
    order.update(total_price: order.order_items.pluck(:total).sum)
    cart.total_price

    redirect_to root_path
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end
end
