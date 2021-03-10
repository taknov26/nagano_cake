module Admins::CustomersHelper
  def status(status)
    if status == true
      "有効"
    else
      "退会"
    end
  end
end
