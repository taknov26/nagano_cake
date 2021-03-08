module Admins::ItemsHelper
  def addTax(money,rate)
    taxed_money = (money*rate).round
    "(#{taxed_money.to_s(:delimited, delimiter: ',')})"
  end

  def number_to_currency(price)
    "#{price.to_s(:delimited, delimiter: ',')}"
  end
end
