class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
      if customer_signed_in?
        root_path
      elsif admin_signed_in?
        admins_top_path
      end
    end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
    keys: [:first_name, :last_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number])
  end
end
