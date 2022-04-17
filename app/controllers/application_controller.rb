class ApplicationController < ActionController::Base
  before_action :update_allowed_parameters, if: :devise_controller?

  def current_user
    super || GuestUser.new
  end

  private

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |user|
      user.permit(:email, :name, :password)
    }

    devise_parameter_sanitizer.permit(:account_update) { |user|
      user.permit(
        :current_password,
        :email,
        :name,
        :password_confirmation,
        :password
      )
    }
  end
end
