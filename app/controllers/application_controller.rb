class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_in_path_for(resource)
    case resource
    when Customer
      new_customers_item_path
    when Admin
      admin_path
    end
  end
  def after_sign_out_path_for(resource)
    case resource
    when :customer
      root_path
    when :admin
      new_admin_administrator_session_path
    end
  end
	def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name,
                                              :first_name,
                                              :last_name_kana,
                                              :first_name_kana,
                                              :postal_code,
                                              :address,
                                              :telephone_number,])
  end
end
