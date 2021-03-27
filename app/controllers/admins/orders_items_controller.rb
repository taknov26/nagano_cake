class Admins::OrdersItemsController < ApplicationController

  def update
    @orders_item = OrdersItem.find(params[:id])
    @order = @orders_item.order
    @orders_items = @order.orders_items
    @orders_item.update(orders_item_params)
      if @orders_item.make_status == 2
        @orders_item.order.orders_status = 2
        @orders_item.order.save
      elsif @orders_items.where(make_status: [3]).count == @orders_items.count
        @orders_item.order.orders_status = 3
        @orders_item.order.save
      end
    redirect_to admins_order_path(@orders_item.order_id)
  end

  private
  def orders_item_params
    params.require(:orders_item).permit(:make_status)
  end
end

#