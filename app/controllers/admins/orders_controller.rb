class Admins::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.orders_status == 1
        @order.orders_items.each do |orders_item|
          orders_item.make_status = 1
          orders_item.save
        end
    end
    redirect_to admins_order_path(@order)
  end

  private
  def order_params
    params.require(:order).permit(:orders_status)
  end

end
