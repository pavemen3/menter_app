class ApplicationController < ActionController::Base
  # rails管理画面とAPIを共存させるには
  include DeviseTokenAuth::Concerns::SetUserByToken
  helper_method :current_user, :user_signed_in?
  include ActionController::MimeResponds
  skip_before_action :verify_authenticity_token
  # InvalidAuthenticityTokenエラーがでるので
  # https://qiita.com/wktq/items/8a4653153af47933c169 参照
  protect_from_forgery unless: -> { request.format.json? }

  before_action :set_host # この行を追加

  def set_host
    Rails.application.routes.default_url_options[:host] = request.host_with_port
  end
end
