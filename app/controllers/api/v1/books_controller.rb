class Api::V1::BooksController < ApplicationController
  def index
    @books = Book.all
    respond_to do |format|
      format.any { render json: @books }
    end
  end
end
