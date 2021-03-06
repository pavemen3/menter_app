class Admin::BooksController < ApplicationController
  # ログインしていないときはログイン画面にリダイレクト
  before_action :authenticate_admin!

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = 1 # staff
    if @book.save
      redirect_to admin_book_path(@book.id), notice: "You have created book successfully."
    else
      render 'new'
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to admin_book_path(@book.id), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to admin_books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :image, :genre)
  end
end
