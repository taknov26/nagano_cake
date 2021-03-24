module Admins::CustomersHelper
  def customer_status(status)
    if status == true
      "有効"
    else
      "退会済み"
    end
  end
end
