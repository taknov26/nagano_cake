class Admins::OrdersItemsController < ApplicationController

  def update
    @orders_item = OrdersItem.find(params[:id])
    @orders_item.update(orders_item_params)
    redirect_to admins_order_path(@orders_item.order_id)
  end

  private
  def orders_item_params
    params.require(:orders_item).permit(:make_status)
  end
end
