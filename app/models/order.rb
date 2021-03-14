class Order < ApplicationRecord
  belongs_to :customer
  has_many :orders_items

  enum payment: {
    credit: 1, #クレジットカード
    bank: 2, #銀行振込
  }
end
