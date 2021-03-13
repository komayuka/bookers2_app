class BooksController < ApplicationController

  def index
   @books = Book.all
   @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
     redireck_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :opinion)
  end

  end
