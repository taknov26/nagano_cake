class Public::CartItemsController < ApplicationController


  def index
    @cart_items = current_customer.cart_items.page(params[:page])
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to public_cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to public_cart_items_path
  end

  def destroy_all
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @cart_items.destroy_all
    redirect_to public_cart_items_path
  end

  def create
    item = Item.find(params[:item_id])
    cart_item = item.cart_items.new(cart_item_params)
    cart_item.customer_id = current_customer.id
    if current_customer.cart_items.find_by(item_id: params[:item_id]).present?
      # cart_item = current_customer.cart_items.find_by(item_id: params[:item_id])
      # cart_item.amount += params[:amount].to_i
      # cart_item.save
     redirect_to public_cart_items_path

    elsif cart_item.save
     redirect_to public_cart_items_path

    else
     render '/'
    end
  end

  private
  def cart_item_params
  params.require(:cart_item).permit(:amount)
  end

end
