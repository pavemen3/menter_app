class Api::V1::BooksController < ApplicationController
  # ログインしていないときはログイン画面にリダイレクト
  before_action :authenticate_user!

  def index
    @books = Book.all
    respond_to do |format|
      format.any { render json: @books }
    end
  end
end
