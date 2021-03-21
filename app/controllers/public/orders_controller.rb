class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer
    @addresses = @customer.addresses
  end

  def confirm
    @customer = current_customer
    @cart_items = @customer.cart_items
    @order = Order.new(order_params)
    if  params[:order][:address_option] == "0"
      @order.postal_code = @customer.postal_code
      @order.address = @customer.address
      @order.orders_name = @customer.full_name

    elsif params[:order][:address_option] == "1"
      @address = Address.find(params[:order][:option])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.orders_name = @address.name

    elsif params[:order][:address_option] == "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.orders_name = params[:order][:orders_name]

    end

  end

  def create
      @order = Order.new(order_params)
      @order.customer_id = current_customer.id
      @order.save
      cart_items = current_customer.cart_items
      cart_items.each do |cart_item|
        orders_item = OrdersItem.new
        orders_item.item_id = cart_item.item_id
        orders_item.price = cart_item.item.price*1.1
        orders_item.amount = cart_item.amount
        orders_item.order_id = @order.id
        orders_item.save
        cart_item.destroy
      end
      redirect_to public_orders_complete_path
  end

  def complete
  end

  def index
    @orders = current_customer.orders.page(params[:page])
  end

  def show
    @order = Order.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:postal_code,
    :address, :orders_name, :payment, :shipping, :billing_amount)
  end

end