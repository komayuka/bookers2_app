class BooksController < ApplicationController

  def index
   @book = Book.all
  end

  def show
    @book = Book.all
  end

  def create
  end

  def edit
    @book = Book.all
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
