class Public::BooksController < ApplicationController
  # ログインしていないときはログイン画面にリダイレクト
  before_action :authenticate_user!

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    # binding.pry
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to public_book_path(@book.id), notice: "You have created book successfully."
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
      redirect_to public_book_path(@book.id), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to public_books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :image, :genre)
  end

end
