class Item < ApplicationRecord
  belongs_to :genre
  has_many :orders_items
  has_many :cart_items
  attachment :image

  # def item_name(number)
    # number = item.id
    # "#{item.name}"
  # end
end
