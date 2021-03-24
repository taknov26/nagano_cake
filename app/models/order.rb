class Order < ApplicationRecord
  belongs_to :customer
  has_many :orders_items
  # accepts_nested_attributes_for :orders_items

  enum payment: {
    クレジットカード: 1, #クレジットカード
    銀行振込: 2, #銀行振込
  }

  with_options presence: true do
    validates :orders_name
    validates :address
    validates :postal_code
  end
end
