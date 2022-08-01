# class Api::V1::Auth::SessionsController < DeviseTokenAuth::RegistrationsController
class Api::V1::Auth::SessionsController < ApplicationController
    # ログイン状態確認用コントローラー
  def index
    if current_user # current_api_v1_userかどうかはのちに確認する
      render json: { is_login: true, data: current_user }
    else
      render json: { is_login: false, message: current_user }
    end
  end
end
