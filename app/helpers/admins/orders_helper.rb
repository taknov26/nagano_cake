module Admins::OrdersHelper
  def order_status(status)
    if status == 0
      "入金待ち"
    elsif status == 1
       "入金確認"
    elsif status == 2
      "製作中"
    elsif status == 3
      "発送準備中"
    elsif status == 4
      "発送済み"
    end
  end
end
