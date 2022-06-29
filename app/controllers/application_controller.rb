class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
      root_path(current_customer.id)
    end



    protected

    def configure_permitted_parameters
      added_attrs = [ :first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number, :email]
        devise_parameter_sanitizer.permit :sign_up, keys: added_attrs

    end

end
