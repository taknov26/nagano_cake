class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer
    @addresses = @customer.addresses.page(params[:page])
  end

  def confirm
    if  params[:order][:address_option] == "0"
      params[:order][:postal_code] = current_customer.postal_code
      params[:order][:address] = current_customer.address
      params[:order][:orders_name] = current_customer.full_name

    elsif params[:order][:address_option] == "1"
      @address = Address.find([:id])
      params[:order][:postal_code] = @address.postal_code
      params[:order][:address] = @address.address
      params[:order][:orders_name] = @address.name

    elsif params[:order][:address_option] == "2"
      params[:order][:postal_code, :address, :orders_name]
    end
    render 'confirm'
  end

  def complete
  end

  def create
  end

  def index
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:postal_code, :address, :orders_name, :payment)
  end

end
