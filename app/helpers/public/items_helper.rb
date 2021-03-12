module Public::ItemsHelper

  def addTax(money,rate)
    taxed_money = (money*rate).round
    "#{taxed_money.to_s(:delimited, delimiter: ',')}"
  end

end
