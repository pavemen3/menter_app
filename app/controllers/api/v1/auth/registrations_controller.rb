class Api::V1::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  # アカウント作成用コントローラー
  before_action :sign_up_params

  private

  def sign_up_params
    params.permit(:email, :password, :password_confirmation, :name)
  end
end
