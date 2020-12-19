class RegistrationsController < Devise::RegistrationsController
  # private

  #   def sign_up
  #     params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  #   end
  #   def account_update_params
  #     params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)
  #   end
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation) }
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password) }
    end
end
