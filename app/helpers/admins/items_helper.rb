module Admins::ItemsHelper
  def addTax(money,rate)
    taxed_money = (money*rate).round
    "(#{taxed_money.to_s(:delimited, delimiter: ',')})"
  end

  def number_to_currency(price)
    "#{price.to_s(:delimited, delimiter: ',')}"
  end

  def item_status(status)
    if status == true
      "販売中"
    else
      "販売停止中"
    end
  end
end
