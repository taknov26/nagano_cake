class Admins::OrdersController < ApplicationController

  def index
    @orders = Order.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.save(order_params)
    redirect_to admins_orders_path
  end

  private
  def order_params
    params.require(:order).permit(:oders_status)
  end

end
