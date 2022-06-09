class Admin::UsersController < ApplicationController
  # ログインしていないときはログイン画面にリダイレクト
  before_action :authenticate_admin!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end
end
