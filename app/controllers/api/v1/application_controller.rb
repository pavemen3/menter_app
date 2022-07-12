module Api
  module V1
    class ApplicationController < ActionController::API # Note: here is not ::BASE
      include DeviseTokenAuth::Concerns::SetUserByToken
      helper_method :current_user, :user_signed_in?
      protect_from_forgery with: :null_session
    end
  end
end
