class Public::ItemsController < ApplicationController

  def index
    @items = Item.page(params[:id]).per(8)
    @items_count = Item.count(:id)
  end

  def show
  end

end
