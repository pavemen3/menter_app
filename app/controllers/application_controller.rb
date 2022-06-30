class ApplicationController < ActionController::Base
  # include DeviseTokenAuth::Concerns::SetUserByToken

  skip_before_action :verify_authenticity_token
  # helper_method :current_user, :user_signed_in?
  protect_from_forgery with: :null_session
  before_action :set_host # この行を追加

  def set_host
    Rails.application.routes.default_url_options[:host] = request.host_with_port
  end
end
