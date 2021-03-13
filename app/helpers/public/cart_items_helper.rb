module Public::CartItemsHelper

  def addTax(money,rate)
    taxed_money = (money*rate).round
    "(#{taxed_money.to_s(:delimited, delimiter: ',')})"
  end

  def subtotalTax(amount,money,rate)
    taxed_money = (amount.to_i*money.to_i*rate).round
    "#{taxed_money.to_s(:delimited, delimiter: ',')}"
  end

  def subtotal(amount,money,rate)
    taxed_money = (amount.to_i*money.to_i*rate).round
    "#{taxed_money.to_i}"
  end

  def number_to_currency(price)
    "#{price.to_s(:delimited, delimiter: ',')}"
  end

end
