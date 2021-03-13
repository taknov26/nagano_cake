class Public::ItemsController < ApplicationController

  def index
    @items = Item.page(params[:id]).per(8)
    @items_count = Item.count(:id)
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

end
