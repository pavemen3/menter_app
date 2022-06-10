class Public::UsersController < ApplicationController
  # ログインしていないときはログイン画面にリダイレクト
  before_action :authenticate_user!

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

  def update
    if @user.update(user_params)
      redirect_to public_user_path(@user.id), notice: "You have updated user successfully."
    else
      @books = @user.books
      render "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :role_id, :avatar)
  end
end
